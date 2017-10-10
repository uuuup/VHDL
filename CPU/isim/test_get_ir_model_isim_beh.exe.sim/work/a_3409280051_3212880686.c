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
static const char *ng0 = "D:/CS/CPU/GETIR.vhd";



static void work_a_3409280051_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    char *t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:    t12 = (t0 + 684U);
    t13 = *((char **)t12);
    t14 = *((unsigned char *)t13);
    t15 = (t14 == (unsigned char)2);
    if (t15 == 1)
        goto LAB7;

LAB8:    t11 = (unsigned char)0;

LAB9:    if (t11 != 0)
        goto LAB5;

LAB6:
LAB10:    t24 = (t0 + 1420U);
    t25 = *((char **)t24);
    t24 = (t0 + 3172);
    t26 = (t24 + 32U);
    t27 = *((char **)t26);
    t28 = (t27 + 40U);
    t29 = *((char **)t28);
    memcpy(t29, t25, 16U);
    xsi_driver_first_trans_fast(t24);

LAB2:    t30 = (t0 + 3088);
    *((int *)t30) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4843);
    t6 = (t0 + 3172);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB5:    t12 = (t0 + 776U);
    t19 = *((char **)t12);
    t12 = (t0 + 3172);
    t20 = (t12 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 40U);
    t23 = *((char **)t22);
    memcpy(t23, t19, 16U);
    xsi_driver_first_trans_fast(t12);
    goto LAB2;

LAB7:    t12 = (t0 + 868U);
    t16 = *((char **)t12);
    t17 = *((unsigned char *)t16);
    t18 = (t17 == (unsigned char)3);
    t11 = t18;
    goto LAB9;

LAB11:    goto LAB2;

}

static void work_a_3409280051_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:    t11 = (t0 + 592U);
    t12 = *((char **)t11);
    t13 = *((unsigned char *)t12);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB5;

LAB6:
LAB2:    t20 = (t0 + 3096);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4859);
    t6 = (t0 + 3208);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB2;

LAB5:    t11 = (t0 + 1420U);
    t15 = *((char **)t11);
    t11 = (t0 + 3208);
    t16 = (t11 + 32U);
    t17 = *((char **)t16);
    t18 = (t17 + 40U);
    t19 = *((char **)t18);
    memcpy(t19, t15, 16U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB2;

}

static void work_a_3409280051_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:    t11 = (t0 + 592U);
    t12 = *((char **)t11);
    t13 = *((unsigned char *)t12);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB5;

LAB6:
LAB2:    t20 = (t0 + 3104);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4875);
    t6 = (t0 + 3244);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB2;

LAB5:    t11 = (t0 + 1420U);
    t15 = *((char **)t11);
    t11 = (t0 + 3244);
    t16 = (t11 + 32U);
    t17 = *((char **)t16);
    t18 = (t17 + 40U);
    t19 = *((char **)t18);
    memcpy(t19, t15, 16U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB2;

}

static void work_a_3409280051_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 1512U);
    t12 = *((char **)t11);
    t11 = (t0 + 3280);
    t13 = (t11 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t12, 16U);
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t17 = (t0 + 3112);
    *((int *)t17) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4891);
    t6 = (t0 + 3280);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3409280051_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 1144U);
    t12 = *((char **)t11);
    t11 = (t0 + 3316);
    t13 = (t11 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t12, 16U);
    xsi_driver_first_trans_fast(t11);

LAB2:    t17 = (t0 + 3120);
    *((int *)t17) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4907);
    t6 = (t0 + 3316);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3409280051_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned char t21;
    char *t22;
    char *t23;
    unsigned char t24;
    unsigned char t25;
    char *t26;
    unsigned char t27;
    unsigned char t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:    t10 = (t0 + 684U);
    t11 = *((char **)t10);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)2);
    if (t13 == 1)
        goto LAB7;

LAB8:    t9 = (unsigned char)0;

LAB9:    if (t9 != 0)
        goto LAB5;

LAB6:    t22 = (t0 + 684U);
    t23 = *((char **)t22);
    t24 = *((unsigned char *)t23);
    t25 = (t24 == (unsigned char)2);
    if (t25 == 1)
        goto LAB12;

LAB13:    t21 = (unsigned char)0;

LAB14:    if (t21 != 0)
        goto LAB10;

LAB11:
LAB2:    t33 = (t0 + 3128);
    *((int *)t33) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 3352);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    t10 = (t0 + 3352);
    t17 = (t10 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t10);
    goto LAB2;

LAB7:    t10 = (t0 + 592U);
    t14 = *((char **)t10);
    t15 = *((unsigned char *)t14);
    t16 = (t15 == (unsigned char)3);
    t9 = t16;
    goto LAB9;

LAB10:    t22 = (t0 + 3352);
    t29 = (t22 + 32U);
    t30 = *((char **)t29);
    t31 = (t30 + 40U);
    t32 = *((char **)t31);
    *((unsigned char *)t32) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t22);
    goto LAB2;

LAB12:    t22 = (t0 + 592U);
    t26 = *((char **)t22);
    t27 = *((unsigned char *)t26);
    t28 = (t27 == (unsigned char)2);
    t21 = t28;
    goto LAB14;

}


extern void work_a_3409280051_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3409280051_3212880686_p_0,(void *)work_a_3409280051_3212880686_p_1,(void *)work_a_3409280051_3212880686_p_2,(void *)work_a_3409280051_3212880686_p_3,(void *)work_a_3409280051_3212880686_p_4,(void *)work_a_3409280051_3212880686_p_5};
	xsi_register_didat("work_a_3409280051_3212880686", "isim/test_get_ir_model_isim_beh.exe.sim/work/a_3409280051_3212880686.didat");
	xsi_register_executes(pe);
}
