#include <stdio.h>
#include <stdint.h>

#define ENDIAN_SWAP(a) (((a&0xFF)<<24)|((a&0xFF0000)>>8)|((a&0xFF00)<<8)|((a&0xFF000000)>>24))
#define ENDIAN_SWAP_FUNC(A) ({int32_t retval; retval = ENDIAN_SWAP(A); retval;})
#define GET_BIT(a,bit_number) 	((a >> bit_number)  & 0x1)
#define GET_BIT_FUNC(A,bit_number) ({int32_t retval; retval = GET_BIT(A,bit_number); retval;})

#define BIT0    (0x00000001)
#define BIT1    (0x00000002)
#define BIT2    (0x00000004)
#define BIT3    (0x00000008)
#define BIT4    (0x00000010)
#define BIT5    (0x00000020)
#define BIT6    (0x00000040)
#define BIT7    (0x00000080)
#define BIT8    (0x00000100)
#define BIT9    (0x00000200)
#define BIT10   (0x00000400)
#define BIT11   (0x00000800)
#define BIT12   (0x00001000)
#define BIT13   (0x00002000)
#define BIT14   (0x00004000)
#define BIT15   (0x00008000)
#define BIT16   (0x00010000)
#define BIT17   (0x00020000)
#define BIT18   (0x00040000)
#define BIT19   (0x00080000)
#define BIT20   (0x00100000)
#define BIT21   (0x00200000)
#define BIT22   (0x00400000)
#define BIT23   (0x00800000)
#define BIT24   (0x01000000)
#define BIT25   (0x02000000)
#define BIT26   (0x04000000)
#define BIT27   (0x08000000)
#define BIT28   (0x10000000)
#define BIT29   (0x20000000)
#define BIT30   (0x40000000)
#define BIT31   (0x80000000)

void bin_printf(int32_t number)
{
	//int32_t result;
	printf("%x\n",number);
	int32_t n=31;
	while (n+1) {
	    printf("%d",GET_BIT_FUNC(number,n--));
	    if(!((n+1)%4)) printf(" ");
	}
	printf("\n");
}
void printb(void *number,uint8_t number_of_bits)
{
	int32_t n=number_of_bits-1;
	int32_t *inner = number;
	while (n+1) {
	    printf("%d",GET_BIT_FUNC(*inner,n--));
	    if(!((n+1)%4)) printf(" ");
	}
	printf("\n");
}
int32_t a=0xabcdef20;
int32_t b=0xabcd;
int32_t main(void){
  //printf("%x \n%x \n", a, ENDIAN_SWAP(a));
  bin_printf(a);
  printb((void *)&a,16);
  printb((void *)&b,16);
  a = ENDIAN_SWAP_FUNC(a);
  bin_printf(a);
  //bin_printf(ENDIAN_SWAP(a));
  //bin_printf(ENDIAN_SWAP(a));
  return 0;
}