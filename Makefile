all: recorder server

recorder: recorder.c
	gcc recorder.c -o recorder `pkg-config --cflags --libs gstreamer-interfaces-0.10 gtk+-2.0 gstreamer-pbutils-0.10 gstreamer-0.10`

server: server.c 
	gcc server.c -o server `pkg-config --cflags --libs gstreamer-interfaces-0.10 gtk+-2.0 gstreamer-pbutils-0.10 gstreamer-0.10`

send:
	./server mp2_video_1.mkv 

record:
	./recorder j v m jvm

commit:
	git add recorder.c 
	git add server.c 
	git add Makefile
	git add README.md 
	git commit -m "cs414_mp2"
	git push -u origin master

clean:
	rm -rf *o server recorder