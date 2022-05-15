![image](media/7495687e7c341efd387f724840a26740.png)**  
CALIFORNIA STATE UNIVERSITY, NORTHRIDGE**

COLLEGE OF ENGINEERING AND COMPUTER SCIENCE

**ECE 520 Project: UART Palindrome Checker**

Instructor: Janamian, Saba

Author: Kenneth Galindo

**Preface & Contributions**

The following lab report entails performing the final project for ECE 520 successfully, using abstract ideas taken from ECE 520. These topics include, but are not limited to: UART, C code, and the implementation upon the Zybo boards (Z7-10 or Z7-20). The report will entail an introduction of the topics mentioned, procedural steps of how the lab was performed, the results of such implementations, and any concluding information that may help in full understanding of materials presented within this report.

It may also be noted that several resources were provided by the instructor (Saba Janamian), and some screenshots are taken from his lectures which may be found within the resources section.

**Table of Contents**

[**Introduction:**](https://github.com/kg323/520_Project#_Toc99827253)

[**UART:**](https://github.com/kg323/520_Project#_Toc99827254)

[**Procedures:**](https://github.com/kg323/520_Project#_Toc99827257)

[**Results:**](https://github.com/kg323/520_Project#_Toc99827258)

[**Resources:**](https://github.com/kg323/520_Project#_Toc99827259)

**Introduction:**

**UART:**

What is UART?

The UART is known as a "Universal Asynchronous Receiver/Transmitter", and is referred to as Universal due to the fact that the data format and speed of transmission can be reconfigured, and Asynchronous since it does not have a clock. UART was first developed by Gordon Bell at Digital Equipment Corporation in the 1960's, and is able to communicate in various methods such as a **full-duplex (devices use same line for data simultaneously), half-duplex (meaning 2 devices communicate at same time), or simplex (data communication occurs only one single way)**. In order to communicate successfully, the UART must have both the transmission and receiving communications configured in the same manner. The procedure for this will be explained in the following section.

![image](media/5e21f3d16da0579803b85c4f4c154564.png)

How UART Protocol Works:

We can take the following picture to illustrate just exactly how a UART protocol works.

![image](media/acf1525b177016b6cb32a9ba8a5aa028.png)

*Figure* 1: UART Communication example between two devices\_

From this illustration, we can see that **both devices transmit data (using the Tx lines), receive the data (Rx lines), and have a common reference to ground (GND)**. Whenever we want to transmit data from one device to another, we do so by having the Tx line of our data terminal (being the GPS) going into the Rx line of our data communication (being the microcontroller). The same is done from the µC into the GPS, since both lines must transmit and receive the data accordingly. The GND simply can connect into the same lines since these are only a reference ground. **It is worth noting that there is no need for addressing in this protocol since it is transferring data over two wires directly**. A more in-depth picture can be found below, which highlights just exactly the manner in which data is transmitted in the UART communication.

![image](media/abfcf919da7b98193390b42d16e17f1b.png)

*Figure* 2: This is illustrating the data frame in which data is transmitted from devices in a UART protocol.

Since we determine when the protocol begins **by coming out of Idle (logic 1), we must initialize the protocol by enabling a start bit (which is a logic 0) and following this is the data and remaining bits we can be found in the procedure below.**

**UART Procedure:**

1.  We can begin by first determining data, which in this example is set for 8 bits (a byte is the most common for a UART protocol). Knowing we have our specified number of bits for data, we can the proceed to set the bit rate (or BAUD rate) for the protocol.

\-In this illustration, we see that we have a hex value of 0xc9 (equivalent to 11001001 in binary) for our data.

1.  The **BAUD rates can be set at 2400, 4800, 9600, 19,200 or 115,200**. This must be done for both devices, otherwise there may not be a successful communication between devices.
2.  Next is the endianness, which simply determines whether the data will be read as **LSB (least significant bit first), or MSB (most significant bit first).**

\-For this example, we are using little endian since LSB is at front (11001001 -&gt; 10010011)

1.  Parity bit will then come next (but this bit is most commonly set to none so this can be ignored).

\-To specify there are 5 parity bits which include: **odd parity** means you need odd number of 1's, **even parity** is even number of 1's, **mark and space** are always 1 and **none** signifies no value.

1.  Finally, we end with a stop bit which then allows the logic to idle at logic 1 again determining that this is the end of transmitting data.

**Procedures:**

1.  First the environment was created, and a workspace was made within the working directory file in order to properly establish the project. After this was done, the project was created and the Zybo-7Z10 board was selected.

![image](media/1edf5b7ca4d18f174797b91b249ef50a.png)

1.  Once the board was selected, we create a block design (here it is called “design_1") and the Zynq7 Processor IP block was added.

![image](media/447b66eda5ef8ce908209848a02d7cd2.png)

3.Upon adding the processor IP, we double click the IP block in order to open the properties in order to re-customize the IP. We do this in order to enable the UART Peripheral I/O pin.

![image](media/990457de0ad01013f5c88af65f1bb1c6.png)

1.  We then check the BAUD rate in order to ensure that there is proper communication between UART protocol in order to avoid any issues when connecting with the Vitis Serial Terminal.

![image](media/11efcb396cc829915c9037565b3ef98a.png)

1.  Once all these steps are done, we can then close the window and run the connection automation. We click OK, and let the connection automation run in order to finalize the IP block.

![image](media/de46416e6fe4fac1d40867e84befdc6d.png)

1.  Once the connections are made, we create the HDL wrapper, generate the bitstream, and open the implemented design in order to export it. This is demonstrating the finalized hardware that will be implemented. After this, we export the hardware into the same workspace folder for Vitis use.

![image](media/c396dea2ec40dea4e4f3550ab8fce30e.png)

1.  After exporting the hardware, we can open Vitis IDE in order to create our work space. We can choose the same working folder in order to create the project. We then choose the created wrapper hardware from Vivado, create an empty C++ file, and finalize our project.
2.  Once Vitis workspace is made, we can then proceed to create our C++ code in order to create our working palindrome checker. After the code is completed, we can then connect our Zybo-7Z10 through the USB port and choosing the correct port and BAUD rate

![image](media/ade48366a3e149942411e0abc4f5e479.png)

**Implementation:**

The following link will take you to the google drive showing the final implementation of the code:

<https://drive.google.com/file/d/1N8GMmGJ1OzD4JLQse5LWIPAdnbb-zQIX/view?usp=sharing>

**Resources:**

<https://www.youtube.com/watch?v=33dmXAAaD28>

<https://digilent.com/reference/learn/fundamentals/communication-protocols/uart/start>

<https://www.societyofrobots.com/microcontroller_uart.shtml?_ga=2.98439196.2036690262.1648250900-1887899079.1648250900>

<https://www.camiresearch.com/Data_Com_Basics/RS232_standard.html?_ga=2.98439196.2036690262.1648250900-1887899079.1648250900>

[http://users.ece.utexas.edu/\~valvano/Volume1/E-Book/C11_SerialInterface.htm?_ga=2.98439196.2036690262.1648250900-1887899079.1648250900](http://users.ece.utexas.edu/~valvano/Volume1/E-Book/C11_SerialInterface.htm?_ga=2.98439196.2036690262.1648250900-1887899079.1648250900)

[https://docs.oracle.com/cd/E81005_01/doc.10/e81016/c_connectors_RS232DB9.htm\#MICRS-RS232DB9Connector-343055A5](https://docs.oracle.com/cd/E81005_01/doc.10/e81016/c_connectors_RS232DB9.htm#MICRS-RS232DB9Connector-343055A5)

<https://www.electronicwings.com/raspberry-pi/raspberry-pi-uart-communication-using-python-and-c>

<https://www.researchgate.net/figure/Fig-4-MAX232-RS232-level-converter_fig3_313362947>

<https://www.tooabstractive.com/networking/what-is-simplex-half-duplex-and-full-duplex/>

[https://docs.google.com/presentation/d/1pjsGZdrQyGiuueZElqCHzTEBV59y_yQQWZxfCCE7j8M/edit\#slide=id.g11dd3c3fcb9_0_38](https://docs.google.com/presentation/d/1pjsGZdrQyGiuueZElqCHzTEBV59y_yQQWZxfCCE7j8M/edit#slide=id.g11dd3c3fcb9_0_38)

[https://support.xilinx.com/s/article/407537?language=en\\_US](https://support.xilinx.com/s/article/407537?language=en%5C_US)


