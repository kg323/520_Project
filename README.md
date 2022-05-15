![image](https://user-images.githubusercontent.com/98668234/161411606-84b3c178-7f3d-49d9-9963-30db35108f6e.png)

# **CALIFORNIA STATE UNIVERSITY, NORTHRIDGE**

COLLEGE OF ENGINEERING AND COMPUTER SCIENCE

# **ECE 520 Lab 7: UART Palindrome Checker**

Instructor: Janamian, Saba

Author: Kenneth Galindo

**Preface &amp; Contributions**

The following lab report entails performing the final project for ECE 520 successfully, using abstract ideas taken from ECE 520. These topics include, but are not limited to: UART, C code, and the implementation upon the Zybo boards (Z7-10 or Z7-20). The report will entail an introduction of the topics mentioned, procedural steps of how the lab was performed, the results of such implementations, and any concluding information that may help in full understanding of materials presented within this report.

It may also be noted that several resources were provided by the instructor (Saba Janamian), and some screenshots are taken from his lectures which may be found within the resources section.

# Table of Contents

[**Introduction:** 3](#_Toc99827253)

[**UART:** 3](#_Toc99827254)

[**TTC:** 6](#_Toc99827255)

[**Interrupts:** 8](#_Toc99827256)

[**Procedures:** 9](#_Toc99827257)

[**Results:** 23](#_Toc99827258)

[**Resources:** 24](#_Toc99827259)

## **Introduction:**

### **UART:**

What is UART?

The UART is known as a &quot;Universal Asynchronous Receiver/Transmitter&quot;, and is referred to as Universal due to the fact that the data format and speed of transmission can be reconfigured, and Asynchronous since it does not have a clock. UART was first developed by Gordon Bell at Digital Equipment Corporation in the 1960&#39;s, and is able to communicate in various methods such as a **full-duplex (devices use same line for data simultaneously), half-duplex (meaning 2 devices communicate at same time), or simplex (data communication occurs only one single way)**. In order to communicate successfully, the UART must have both the transmission and receiving communications configured in the same manner. The procedure for this will be explained in the following section.

![image](https://user-images.githubusercontent.com/98668234/161411610-66da40f5-adce-442d-9e2e-f36a6e4c78ab.png)

How UART Protocol Works:

We can take the following picture to illustrate just exactly how a UART protocol works.

![image](https://user-images.githubusercontent.com/98668234/161411617-a894b66f-7d57-4e95-954c-b442b7dde8c9.png)

_Figure_ 1_: UART Communication example between two devices_

From this illustration, we can see that **both devices transmit data (using the Tx lines), receive the data (Rx lines), and have a common reference to ground (GND)**. Whenever we want to transmit data from one device to another, we do so by having the Tx line of our data terminal (being the GPS) going into the Rx line of our data communication (being the microcontroller). The same is done from the µC into the GPS, since both lines must transmit and receive the data accordingly. The GND simply can connect into the same lines since these are only a reference ground. **It is worth noting that there is no need for addressing in this protocol since it is transferring data over two wires directly**. A more in-depth picture can be found below, which highlights just exactly the manner in which data is transmitted in the UART communication.

![image](https://user-images.githubusercontent.com/98668234/161411620-224fd6bb-94f1-4563-a021-e9e48d602317.png)

_Figure_ 2_: This is illustrating the data frame in which data is transmitted from devices in a UART protocol._

Since we determine when the protocol begins **by coming out of Idle (logic 1), we must initialize the protocol by enabling a start bit (which is a logic 0) and following this is the data and remaining bits we can be found in the procedure below.**

_ **UART Procedure:** _

1. We can begin by first determining data, which in this example is set for 8 bits (a byte is the most common for a UART protocol). Knowing we have our specified number of bits for data, we can the proceed to set the bit rate (or BAUD rate) for the protocol.

-In this illustration, we see that we have a hex value of 0xc9 (equivalent to 11001001 in binary) for our data.

1. The **BAUD rates can be set at 2400, 4800, 9600, 19,200 or 115,200**. This must be done for both devices, otherwise there may not be a successful communication between devices.

1. Next is the endianness, which simply determines whether the data will be read as **LSB (least significant bit first), or MSB (most significant bit first).**

-For this example, we are using little endian since LSB is at front (11001001 -\&gt; 10010011)

1. Parity bit will then come next (but this bit is most commonly set to none so this can be ignored).

-To specify there are 5 parity bits which include: **odd parity** means you need odd number of 1&#39;s, **even parity** is even number of 1&#39;s, **mark and space** are always 1 and **none** signifies no value.

1. Finally, we end with a stop bit which then allows the logic to idle at logic 1 again determining that this is the end of transmitting data.

