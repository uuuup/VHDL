/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/CS/CPU/CLOCK_CPU.vhd";



static void work_a_0407585031_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;

LAB0:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 2812);
    t6 = (t0 + 1744);
    t10 = (t6 + 32U);
    t11 = *((char **)t10);
    t13 = (t11 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 4U);
    xsi_driver_first_trans_fast_port(t6);

LAB3:    t1 = (t0 + 1700);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 684U);
    t6 = *((char **)t1);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB8;

LAB9:    t5 = (unsigned char)0;

LAB10:    if (t5 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(56, ng0);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(46, ng0);
    t10 = (t0 + 948U);
    t11 = *((char **)t10);
    t12 = *((int *)t11);
    if (t12 == 0)
        goto LAB12;

LAB17:    if (t12 == 1)
        goto LAB13;

LAB18:    if (t12 == 2)
        goto LAB14;

LAB19:    if (t12 == 3)
        goto LAB15;

LAB20:
LAB16:    xsi_set_current_line(51, ng0);

LAB11:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 948U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t19 = (t12 + 1);
    t1 = (t0 + 948U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    *((int *)t1) = t19;
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 948U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t3 = (t12 == 4);
    if (t3 != 0)
        goto LAB22;

LAB24:
LAB23:    goto LAB6;

LAB8:    t1 = (t0 + 660U);
    t9 = xsi_signal_has_event(t1);
    t5 = t9;
    goto LAB10;

LAB12:    xsi_set_current_line(47, ng0);
    t10 = (t0 + 2796);
    t14 = (t0 + 1744);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    memcpy(t18, t10, 4U);
    xsi_driver_first_trans_fast_port(t14);
    goto LAB11;

LAB13:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 2800);
    t6 = (t0 + 1744);
    t10 = (t6 + 32U);
    t11 = *((char **)t10);
    t13 = (t11 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 4U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB11;

LAB14:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 2804);
    t6 = (t0 + 1744);
    t10 = (t6 + 32U);
    t11 = *((char **)t10);
    t13 = (t11 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 4U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB11;

LAB15:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 2808);
    t6 = (t0 + 1744);
    t10 = (t6 + 32U);
    t11 = *((char **)t10);
    t13 = (t11 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 4U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB11;

LAB21:;
LAB22:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 948U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    *((int *)t1) = 0;
    goto LAB23;

}


extern void work_a_0407585031_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0407585031_3212880686_p_0};
	xsi_register_didat("work_a_0407585031_3212880686", "isim/test_CPU_isim_beh.exe.sim/work/a_0407585031_3212880686.didat");
	xsi_register_executes(pe);
}
