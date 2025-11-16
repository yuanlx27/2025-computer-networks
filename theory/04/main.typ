#import "@local/sysu-templates:0.2.0": exercise

#show: exercise.with(
  title: "Exercise 4",
  subtitle: "Computer Networks (Theory)",
  student: (name: "Langxi Yuan", id: "23336294"),
)

#page([
  #set align(center + horizon)

  Made with #link("https://typst.app")[Typst].

  Source code available at:

  https://github.com/yuanlx27/2025-computer-networks
])

#let solution(body) = block(inset: 0.5em, width: 100%)[
  *_Solution._* #body
]

= P1

Consider the network below.

+ Show the forwarding table in router A,
  such that all traffic destined to host H3 is forwarded through interface 3.

+ Can you write down a forwarding table in router A,
  such that all traffic from H1 destined to host H3 is forwarded through interface 3,
  while all traffic from H2 destined to host H3 is forwarded through interface 4?
  (_Hint:_ This is a trick question.)

#figure(image("assets/images/20251116-064539.png")) <fig-1>

#solution[
  + ```
    Destination   Interface
    H3            3
    ```

  + No, because the forwarding table is based only on the destination address.
]

= P4

Consider the switch shown below.
Suppose that all datagrams have the same fixed length,
that the switch operates in a slotted, synchronous manner,
and that in one time slot a datagram can be transferred from an input port to an output port.
The switch fabric is a crossbar
so that at most one datagram can be transferred to a given output port in a time slot,
but different output ports can receive datagrams from different input ports in a single time slot.
What is the minimal number of time slots needed to transfer the packets shown from input ports to their output ports,
assuming any input queue scheduling order you want (i.e., it need not have HOL blocking)?
What is the largest number of slots needed, assuming the worst-case scheduling order you can devise,
assuming that a non-empty input queue is never idle?

#figure(image("assets/images/20251116-064705.png")) <fig-2>

#solution[
  Minimal number of time slots is 3.
  One possible scheduling order is as follows.

  - Slot 1: send X1, Y2;

  - Slot 2: send X2, Y3;

  - Slot 3: send Z3.

  Maximal number of time slots is also 3,
  since we can always send two datagrams in the second slot, assuming a non-empty input queue is never idle.
]

= P6

Consider a datagram network using 8-bit host addresses.
Suppose a router uses longest prefix matching and has the following forwarding table:

#figure(image(width: 40%, "assets/images/20251116-064819.png")) <fig-3>

For each of the four interfaces, give the associated range of destination host
addresses and the number of addresses in the range.

#solution[
  - Interface 0: `00000000` to `00111111`, 64 addresses.

  - Interface 1: `01000000` to `01111111`, 64 addresses.

  - Interface 2: `10000000` to `10011111`, 32 addresses.

  - Interface 3: `10100000` to `11111111`, 96 addresses.
]

= P8

Consider a router that interconnects three subnets: Subnet 1, Subnet 2, and Subnet 3.
Suppose all of the interfaces in each of these three subnets are required to have the prefix 223.1.17/24.
Also suppose that Subnet 1 is required to support up to 62 interfaces,
Subnet 2 is to support up to 106 interfaces,
and Subnet 3 is to support up to 15 interfaces.
Provide three network addresses (of the form a.b.c.d/x) that satisfy these constraints.

#solution[
  - Subnet 1: 223.1.17.0/26;

  - Subnet 2: 223.1.17.128/25;

  - Subnet 3: 223.1.17.64/28.
]

= P11

Consider a subnet with prefix 192.168.56.128/26.
Give an example of one IP address (of form xxx.xxx.xxx.xxx) that can be assigned to this network.
Suppose an ISP owns the block of addresses of the form 192.168.56.32/26.
Suppose it wants to create four subnets from this block, with each block having the same number of IP addresses.
What are the prefixes (of form a.b.c.d/x) for the four subnets?

#solution[
  - IP: 192.168.56.128.

  - Subnet 1: 192.168.56.0/28

  - Subnet 2: 192.168.56.16/28

  - Subnet 3: 192.168.56.32/28

  - Subnet 4: 192.168.56.48/28
]

= P16

Consider the network setup in @fig-4.
Suppose that the ISP instead assigns the router the address 24.34.112.235
and that the network address of the home network is 192.168.1/24.

+ Assign addresses to all interfaces in the home network.

+ Suppose each host has two ongoing TCP connections, all to port 80 at host 128.119.40.86.
  Provide the six corresponding entries in the NAT translation table.

#figure(
  caption: [Figure 4.25 from textbook],
  image("assets/images/20251116-063228.png"),
) <fig-4>

#solution[
  + Home network addresses are 192.168.1.1, 192.168.1.2, 192.168.1.3, with the router interface being 192.168.1.4.

  + See @tab-1.

    #figure(
      caption: [NAT translation table],
      table(
        columns: 2,
        [WAN side], [LAN side],
        [24.34.112.235, 5001], [192.168.1.1, 3345],
        [24.34.112.235, 5002], [192.168.1.1, 3346],
        [24.34.112.235, 5003], [192.168.1.2, 3445],
        [24.34.112.235, 5004], [192.168.1.2, 3446],
        [24.34.112.235, 5005], [192.168.1.3, 3545],
        [24.34.112.235, 5006], [192.168.1.3, 3546],
      ),
    ) <tab-1>
]

= P19

Consider the SDN OpenFlow network shown in @fig-5.
Suppose that the desired forwarding behavior for datagrams arriving at s2 is as follows:

- any datagrams arriving on input port 1 from hosts h5 or h6
  that are destined to hosts h1 or h2 should be forwarded over output port 2;

- any datagrams arriving on input port 2 from hosts h1 or h2
  that are destined to hosts h5 or h6 should be forwarded over output port 1;

- any arriving datagrams on input ports 1 or 2
  and destined to hosts h3 or h4 should be delivered to the host specified;

- hosts h3 and h4 should be able to send datagrams to each other.

Specify the flow table entries in s2 that implement this forwarding behavior.

#figure(
  caption: [Figure 4.30 from textbook],
  image("assets/images/20251116-063337.png"),
) <fig-5>

#solution[
  See @tab-2.

  #figure(
    caption: [s2 flow table],
    table(
      columns: 2,
      [Match], [Action],
      [Ingress Port = 1; IP Src = `10.3.*.*`; IP Dst = `10.1.*.*`], [Forward(2)],
      [Ingress Port = 2; IP Src = `10.1.*.*`; IP Dst = `10.3.*.*`], [Forward(1)],
      [IP Dst = `10.2.0.3`], [Forward(3)],
      [IP Dst = `10.2.0.4`], [Forward(4)],
    ),
  ) <tab-2>
]

= P21

Consider again the scenario from P19 above.
Give the flow tables entries at packet switches s1 and s3,
such that any arriving datagrams with a source address of h3 or h4 are routed to the destination hosts
specified in the destination address field in the IP datagram.
(_Hint:_ Your forwarding table rules should include the cases
that an arriving datagram is destined for a directly attached host
or should be forwarded to a neighboring router for eventual host delivery there.)

#solution[
  See @tab-3 and @tab-4.

  #figure(
    caption: [s1 flow table],
    table(
      columns: 2,
      [Match], [Action],
      [IP Src = `10.2.*.*`; IP Dst = `10.1.0.1`], [Forward(2)],
      [IP Src = `10.2.*.*`; IP Dst = `10.1.0.2`], [Forward(3)],
      [IP Src = `10.2.*.*`; IP Dst = `10.3.*.*`], [Forward(1)],
    ),
  ) <tab-3>

  #figure(
    caption: [s3 flow table],
    table(
      columns: 2,
      [Match], [Action],
      [IP Src = `10.2.*.*`; IP Dst = `10.3.0.5`], [Forward(2)],
      [IP Src = `10.2.*.*`; IP Dst = `10.3.0.6`], [Forward(1)],
      [IP Src = `10.2.*.*`; IP Dst = `10.1.*.*`], [Forward(3)],
    ),
  ) <tab-4>
]

= P22

Consider again the SDN OpenFlow network shown in @fig-5.
Suppose we want switch s2 to function as a firewall.
Specify the flow table in s2 that implements the following firewall behaviors
(specify a different flow table for each of the four firewalling behaviors below)
for delivery of datagrams destined to h3 and h4.
You do not need to specify the forwarding behavior in s2 that forwards traffic to other routers.

- Only traffic arriving from hosts h1 and h6 should be delivered to hosts h3 or h4
  (i.e., that arriving traffic from hosts h2 and h5 is blocked).

- Only TCP traffic is allowed to be delivered to hosts h3 or h4
  (i.e., that UDP traffic is blocked).

- Only traffic destined to h3 is to be delivered
  (i.e., all traffic to h4 is blocked).

- Only UDP traffic from h1 and destined to h3 is to be delivered.
  All other traffic is blocked.

#solution[
  See @tab-5, @tab-6, @tab-7, and @tab-8.

  #figure(
    caption: [s2 flow table (senario 1)],
    table(
      columns: 2,
      table.header([Match], [Action]),
      [IP Src = `10.1.0.1`; IP Dst = `10.2.0.3`], [Forward(3)],
      [IP Src = `10.1.0.1`; IP Dst = `10.2.0.4`], [Forward(4)],
      [IP Src = `10.3.0.6`; IP Dst = `10.2.0.3`], [Forward(3)],
      [IP Src = `10.3.0.6`; IP Dst = `10.2.0.4`], [Forward(4)],
    ),
  ) <tab-5>

  #figure(
    caption: [s2 flow table (senario 2)],
    table(
      columns: 2,
      table.header([Match], [Action]),
      [IP Src = `*.*.*.*`; IP Dst = `10.2.0.3`; Port = TCP], [Forward(3)],
      [IP Src = `*.*.*.*`; IP Dst = `10.2.0.4`; Port = TCP], [Forward(4)],
    ),
  ) <tab-6>

  #figure(
    caption: [s2 flow table (senario 3)],
    table(
      columns: 2,
      table.header([Match], [Action]),
      [IP Src = `*.*.*.*`; IP Dst = `10.2.0.3`], [Forward(3)],
    ),
  ) <tab-7>

  #figure(
    caption: [s2 flow table (senario 4)],
    table(
      columns: 2,
      table.header([Match], [Action]),
      [IP Src = `10.1.0.1`; IP Dst = `10.2.0.3`; Port = UDP], [Forward(3)],
    ),
  ) <tab-8>
]
