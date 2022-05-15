![image](https://user-images.githubusercontent.com/98668234/161411606-84b3c178-7f3d-49d9-9963-30db35108f6e.png)

# **CALIFORNIA STATE UNIVERSITY, NORTHRIDGE**

COLLEGE OF ENGINEERING AND COMPUTER SCIENCE

# **ECE 520 Project: UART Palindrome Checker**

Instructor: Janamian, Saba

Author: Kenneth Galindo

**Preface &amp; Contributions**

The following lab report entails performing the final project for ECE 520 successfully, using abstract ideas taken from ECE 520. These topics include, but are not limited to: UART, C code, and the implementation upon the Zybo boards (Z7-10 or Z7-20). The report will entail an introduction of the topics mentioned, procedural steps of how the lab was performed, the results of such implementations, and any concluding information that may help in full understanding of materials presented within this report.
It may also be noted that several resources were provided by the instructor (Saba Janamian), and some screenshots are taken from his lectures which may be found within the resources section.


# Table of Contents

[**Introduction:** ](#_Toc99827253)

[**UART:** ](#_Toc99827254)

[**Procedures:** ](#_Toc99827257)

[**Results:** ](#_Toc99827258)

[**Resources:** ](#_Toc99827259)

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

2. The **BAUD rates can be set at 2400, 4800, 9600, 19,200 or 115,200**. This must be done for both devices, otherwise there may not be a successful communication between devices.

3. Next is the endianness, which simply determines whether the data will be read as **LSB (least significant bit first), or MSB (most significant bit first).**

-For this example, we are using little endian since LSB is at front (11001001 -\&gt; 10010011)

4. Parity bit will then come next (but this bit is most commonly set to none so this can be ignored).

-To specify there are 5 parity bits which include: **odd parity** means you need odd number of 1&#39;s, **even parity** is even number of 1&#39;s, **mark and space** are always 1 and **none** signifies no value.

5. Finally, we end with a stop bit which then allows the logic to idle at logic 1 again determining that this is the end of transmitting data.

## **Procedures:**

1. First the environment was created, and a workspace was made within the working directory file in order to properly establish the project. After this was done, the project was created and the Zybo-7Z10 board was selected.

![image](https://user-images.githubusercontent.com/98668234/168455944-e163d940-7095-48ba-994e-8bcd10597e14.png)


2.Once the board was selected, we create a block design (here it is called “design_1") and the Zynq7 Processor IP block was added.


![image](https://user-images.githubusercontent.com/98668234/168456043-6ba95045-81e7-48eb-a65f-da087b544aa1.png)


3.Upon adding the processor IP, we double click the IP block in order to open the properties in order to re-customize the IP. We do this in order to enable the UART Peripheral I/O pin.


![image](https://user-images.githubusercontent.com/98668234/168456004-bce0e27e-a5c9-4b93-a24b-dac715b1bf1a.png)



4. We then check the BAUD rate in order to ensure that there is proper communication between UART protocol in order to avoid any issues when connecting with the Vitis Serial Terminal.


![image](https://user-images.githubusercontent.com/98668234/168456014-49bda303-159a-4fe7-b39a-564338290538.png)


5. Once all these steps are done, we can then close the window and run the connection automation. We click OK, and let the connection automation run in order to finalize the IP block.


![image](https://user-images.githubusercontent.com/98668234/168456112-17840d71-fbbb-47aa-92bd-2ced51bc1e81.png)


6. Once the connections are made, we create the HDL wrapper, generate the bitstream, and open the implemented design in order to export it. This is demonstrating the finalized hardware that will be implemented. After this, we export the hardware into the same workspace folder for Vitis use.


![image](https://user-images.githubusercontent.com/98668234/168456024-a46905dc-7ae7-46e1-8140-bbba41114b61.png)


7. After exporting the hardware, we can open Vitis IDE in order to create our work space. We can choose the same working folder in order to create the project. We then choose the created wrapper hardware from Vivado, create an empty C++ file, and finalize our project.


8. Once Vitis worksspace is made, we can then proceed to create our C++ code in order to create our working palindrome checker. After the code is completed, we can then connect our Zybo-7Z10 through the USB port and choosing the correct port and BAUD rate


![image](https://user-images.githubusercontent.com/98668234/168456483-cb573490-607a-495a-8832-22ffcb99db41.png)



## **Implementation:**

The following link will take you to the google drive showing the final implementation of the code:

https://drive.google.com/file/d/1N8GMmGJ1OzD4JLQse5LWIPAdnbb-zQIX/view?usp=sharing



## **Resources:**


[https://www.youtube.com/watch?v=33dmXAAaD28](https://www.youtube.com/watch?v=33dmXAAaD28)

[https://digilent.com/reference/learn/fundamentals/communication-protocols/uart/start](https://digilent.com/reference/learn/fundamentals/communication-protocols/uart/start)

[https://www.societyofrobots.com/microcontroller\_uart.shtml?\_ga=2.98439196.2036690262.1648250900-1887899079.1648250900](https://www.societyofrobots.com/microcontroller_uart.shtml?_ga=2.98439196.2036690262.1648250900-1887899079.1648250900)

[https://www.camiresearch.com/Data\_Com\_Basics/RS232\_standard.html?\_ga=2.98439196.2036690262.1648250900-1887899079.1648250900](https://www.camiresearch.com/Data_Com_Basics/RS232_standard.html?_ga=2.98439196.2036690262.1648250900-1887899079.1648250900)

[http://users.ece.utexas.edu/~valvano/Volume1/E-Book/C11\_SerialInterface.htm?\_ga=2.98439196.2036690262.1648250900-1887899079.1648250900](http://users.ece.utexas.edu/~valvano/Volume1/E-Book/C11_SerialInterface.htm?_ga=2.98439196.2036690262.1648250900-1887899079.1648250900)

[https://docs.oracle.com/cd/E81005\_01/doc.10/e81016/c\_connectors\_RS232DB9.htm#MICRS-RS232DB9Connector-343055A5](https://docs.oracle.com/cd/E81005_01/doc.10/e81016/c_connectors_RS232DB9.htm#MICRS-RS232DB9Connector-343055A5)

[https://www.electronicwings.com/raspberry-pi/raspberry-pi-uart-communication-using-python-and-c](https://www.electronicwings.com/raspberry-pi/raspberry-pi-uart-communication-using-python-and-c)

[https://www.researchgate.net/figure/Fig-4-MAX232-RS232-level-converter\_fig3\_313362947](https://www.researchgate.net/figure/Fig-4-MAX232-RS232-level-converter_fig3_313362947)

https://www.tooabstractive.com/networking/what-is-simplex-half-duplex-and-full-duplex/

[https://docs.google.com/presentation/d/1pjsGZdrQyGiuueZElqCHzTEBV59y\_yQQWZxfCCE7j8M/edit#slide=id.g11dd3c3fcb9\_0\_38](https://docs.google.com/presentation/d/1pjsGZdrQyGiuueZElqCHzTEBV59y_yQQWZxfCCE7j8M/edit#slide=id.g11dd3c3fcb9_0_38)

https://support.xilinx.com/s/article/407537?language=en\_US



