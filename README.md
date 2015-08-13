# Usage

This docker fronts the visity/carbon docker and adds statsd functionality. 

Example, first start the carbon docker (see also visity/carbon):

	docker run -d -v $PWD/whisper/:/opt/graphite/storage/whisper/ --name carbon visity/carbon
	
Then start the statds docker and expose the statsd collect port over udp:

	docker run -d --name statsd --link carbon -p 8125:8125/udp visity/statsd

Note: The name 'carbon' is used in the statsd config, so is required to be exact.