cpus := 8

all: build

sync:
	if ! [ -e haiku ]; then git clone https://review.haiku-os.org/haiku; fi
	cd haiku && git pull --rebase && cd -

build_builder:
	docker image build -t "haiku:build" .

build:
	docker run --rm -e CPUS=$(cpus) -v ${PWD}/haiku:/haiku-source/haiku haiku:build
build_x64:
	docker run --rm -e CPUS=$(cpus) -e HAIKUARCH=x86_64 -v ${PWD}/haiku:/haiku-source/haiku haiku:build
enter:
	docker run -it --rm -v ${PWD}/haiku:/haiku-source/haiku haiku:build bash
clean:
	if [ -e haiku/generated_* ]; then rm -rf haiku/generated_*; fi
upload:
	docker tag haiku:build nulldevil/haiku:build
	docker push nulldevil/haiku:build
