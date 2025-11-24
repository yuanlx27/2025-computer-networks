#import "@local/sysu-templates:0.2.0": exercise

#show: exercise.with(
  title: "Exercise 5: Control Plane",
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

= P3

Consider the following network.
With the indicated link costs, use Dijkstra's shortest-path algorithm
to compute the shortest path from $x$ to all network nodes.
Show how the algorithm works by computing a table similar to Table 5.1.

= P7

Consider the network fragment shown below.
$x$ has only two attached neighbors, $w$ and $y$.
$w$ has a minimum-cost path to destination $u$ (not shown) of 5,
and $y$ has a minimum-cost path to $u$ of 6.
The complete paths from $w$ and $y$ to $u$ (and between $w$ and $y$) are not shown.
All link costs in the network have strictly positive integer values.

#figure(
  "TODO",
) <fig-1>

+ Give $x$'s distance vector for destinations $w$, $y$, and $u$.

+ Give a link-cost change for either $c(x, w)$ or $c(x, y)$
  such that $x$ will inform its neighbors of a new minimum-cost path to $u$
  as a result of executing the distance-vector algorithm.

+ Give a link-cost change for either $c(x, w)$ or $c(x, y)$
  such that $x$ will not inform its neighbors of a new minimum-cost path to $u$
  as a result of executing the distance-vector algorithm.

= P14

Consider the network shown below.
Suppose AS3 and AS2 are running OSPF for their intra-AS routing protocol.
Suppose AS1 and AS4 are running RIP for their intra-AS routing protocol.
Suppose eBGP and iBGP are used for the inter-AS routing protocol.
Initially suppose there is no physical link between AS2 and AS4.

+ Router 3c learns about prefix $x$ from which routing protocol: OSPF, RIP, eBGP, or iBGP?

+ Router 3a learns about $x$ from which routing protocol?

+ Router 1c learns about $x$ from which routing protocol?

+ Router 1d learns about $x$ from which routing protocol?

= P16

Consider the following network.
ISP B provides national backbone service to regional ISP A.
ISP C provides national backbone service to regional ISP D.
Each ISP consists of one AS.
B and C peer with each other in two places using BGP.
Consider traffic going from A to D.
B would prefer to hand that traffic over to C on the West Coast
(so that C would have to absorb the cost of carrying the traffic cross-country),
while C would prefer to get the traffic via its East Coast peering point with B
(so that B would have carried the traffic across the country).
What BGP mechanism might C use,
so that B would hand over A-to-D traffic at its East Coast peering point?
To answer this question, you will need to dig into the BGP specification.

= P18

Consider Figure 5.13.
B would never forward traffic destined to Y via X based on BGP routing.
But there are some very popular applications for which data packets go to X first and then flow to Y.
Identify one such application, and describe how data packets follow a path not given by BGP routing.

= P19

In Figure 5.13, suppose that there is another stub network V that is a customer of ISP A.
Suppose that B and C have a peering relationship, and A is a customer of both B and C.
Suppose that A would like to have the traffic destined to W to come from B only,
and the traffic destined to V from either B or C.
How should A advertise its routes to B and C?
What AS routes does C receive?
