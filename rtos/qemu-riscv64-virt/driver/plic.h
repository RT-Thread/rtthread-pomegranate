/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2021-05-20     bigmagic     first version
 * 2021-10-20     bernard      fix s-mode issue
 */

#ifndef PLIC_H
#define PLIC_H

#include <rtconfig.h>

/*
 * This machine puts platform-level interrupt controller (PLIC) here.
 * Here only list PLIC registers in Machine mode.
 *
 */

#define VIRT_PLIC_BASE                  0x0c000000L

#define PLIC_PRIORITY_OFFSET            (0x0)
#define PLIC_PENDING_OFFSET             (0x1000)

#define PLIC_ENABLE_STRIDE              0x80
#define PLIC_CONTEXT_STRIDE             0x1000

#ifndef RISCV_S_MODE
#define PLIC_MENABLE_OFFSET             (0x2000)
#define PLIC_MTHRESHOLD_OFFSET          (0x200000)
#define PLIC_MCLAIM_OFFSET              (0x200004)
#define PLIC_MCOMPLETE_OFFSET           (0x200004)

#define PLIC_ENABLE(hart)               (VIRT_PLIC_BASE + PLIC_MENABLE_OFFSET +     (hart * 2) * PLIC_ENABLE_STRIDE)
#define PLIC_THRESHOLD(hart)            (VIRT_PLIC_BASE + PLIC_MTHRESHOLD_OFFSET +  (hart * 2) * PLIC_CONTEXT_STRIDE)
#define PLIC_CLAIM(hart)                (VIRT_PLIC_BASE + PLIC_MCLAIM_OFFSET +      (hart * 2) * PLIC_CONTEXT_STRIDE)
#define PLIC_COMPLETE(hart)             (VIRT_PLIC_BASE + PLIC_MCOMPLETE_OFFSET +   (hart * 2) * PLIC_CONTEXT_STRIDE)

#else
#define PLIC_SENABLE_OFFSET             (0x2000   + PLIC_ENABLE_STRIDE)
#define PLIC_STHRESHOLD_OFFSET          (0x200000 + PLIC_CONTEXT_STRIDE)
#define PLIC_SCLAIM_OFFSET              (0x200004 + PLIC_CONTEXT_STRIDE)
#define PLIC_SCOMPLETE_OFFSET           (0x200004 + PLIC_CONTEXT_STRIDE)

#define PLIC_ENABLE(hart)               (VIRT_PLIC_BASE + PLIC_SENABLE_OFFSET +     (hart * 2) * PLIC_ENABLE_STRIDE)
#define PLIC_THRESHOLD(hart)            (VIRT_PLIC_BASE + PLIC_STHRESHOLD_OFFSET +  (hart * 2) * PLIC_CONTEXT_STRIDE)
#define PLIC_CLAIM(hart)                (VIRT_PLIC_BASE + PLIC_SCLAIM_OFFSET +      (hart * 2) * PLIC_CONTEXT_STRIDE)
#define PLIC_COMPLETE(hart)             (VIRT_PLIC_BASE + PLIC_SCOMPLETE_OFFSET +   (hart * 2) * PLIC_CONTEXT_STRIDE)
#endif

#define PLIC_PRIORITY(id)               (VIRT_PLIC_BASE + PLIC_PRIORITY_OFFSET + (id) * 4)
#define PLIC_PENDING(id)                (VIRT_PLIC_BASE + PLIC_PENDING_OFFSET + ((id) / 32))

void plic_set_priority(int irq, int priority);
void plic_irq_enable(int irq);
void plic_irq_disable(int irq);
void plic_set_threshold(int mthreshold);
int  plic_claim(void);
void plic_complete(int irq);

#endif
