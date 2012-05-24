#define con_addr ((volatile unsigned int *)(0x49020000))

char *message="\r\nHello World, I am writen for BeagleBoard!!!!\r\n\0";

start_armboot (void)
{
	while (*message){
		*con_addr=(*message++);
	}
	while(1);
}


