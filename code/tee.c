#include<sys/types.h>
#include<unistd.h>

int main()
{
	char buf[64];

	while (1)
	{
		ssize_t bytes = read(STDIN_FILENO, buf, sizeof(buf));

		if (bytes <= 0)
			return 0;

		char *p=buf;

		do
		{
			ssize_t written = write(STDOUT_FILENO, p, bytes);

			if (written <= 0)
				return 0;

			p += written;
			bytes -= written;

		} while (bytes != 0);
	}
}

