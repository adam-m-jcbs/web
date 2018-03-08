---
layout: page
title: ""
permalink: /research/
---

# Nuclear Astrophysics 
Through a mix of applied mathematics, astrophysics, nuclear physics, and high
performance computing I study some of the universe’s most powerful explosions.
My broad interests and expertise are in nuclear astrophysics.  Below I outline
current projects.


### X-Ray Bursts
X-ray bursts are astrophysical transients originating from thermonuclear
explosions on the surface of a neutron star.  These events are one of the most
exciting laboratories Nature provides us for doing fundamental nuclear physics
that's impossible to do on Earth.  In particular, these events give us unique
insight into the properties of incredibly dense matter at low energies that
cannot be reproduced in a lab.  My work as a JINA-CEE postdocotoral fellow
focuses on developing state-of-the-art multi-dimensional models of X-ray burst
physics.  My current explorations include calculating sensitivities of
observations to uncertain nuclear reaction rates that may be explored at the
[NSCL](http://www.nscl.msu.edu/)/[FRIB](https://frib.msu.edu/), 3D modeling of
low-Mach convective mixing preceding runaway, and multi-D models of superburst
precursor events.


### Accelerated Nuclear Reactions
Computational nuclear astrophysicists like myself often need to include models
of nuclear burning in simulations.  For the type of high performance computing I
do where astrophysical fluid dynamics in multiple spatial dimensions are
modeled, integrating the set of coupled, stiff ODEs describing nuclear burning
can easily start to dominate the calculation or even make it computationally
infeasible.  For this reason, I model a reduced network of nuclear isotopes,
typically choosing a network that will demand no more than 10-30% of a single
timestep in a simulation.  Many interesting problems can be tackled with simple
networks, but some demand more isotopes and more reactions.

In light of this, I led the initial effort to redesign the nuclear reaction
modules in [Maestro](http://amrex-astro.github.io/MAESTRO/) to target
accelerators.  In particular, I have developed the code to utilize GPUs via the
directive-based [OpenACC standard](http://www.openacc.org/).  I have achieved
some initial success for large enough grids of data.  This work is being
integrated into a collaborative effort I'm a part of to develop a set of [open
source microphysics modules](https://github.com/starkiller-astro/Microphysics),
with the hope that the computational astrophysics community at large can
integrate accelerated microphysics into their own codes.  The effort is recent
and ongoing.  Contributions from the community are welcome.


### Sub-Chandrasekhar White Dwarf Explosions 
The focus of my PhD dissertation was investigating the rich explosive
possibilities of sub-Chandrasekhar mass white dwarfs in binary systems.  An
archetypal example of such a system is an AM CVn binary.  Since the [2007
publication](http://adsabs.harvard.edu/abs/2007ApJ...662L..95B) of Lars Bildsten
and collaborators demonstrating the possibility of achieving thermonuclear
runaway in thin helium shells there has been an explosion of interest in these
systems as potential type Ia supernova progenitors.

This alone justifies careful study of these systems, but there’s more!  Toward
lower masses these systems are also uniquely able to produce calcium-44 near
solar abundance (see section 6.1
[here](http://adsabs.harvard.edu/abs/2011ApJ...734...38W)) and can lead to
previously unobserved faint transients that could show up in recent and upcoming
survey experiments (notably, LSST).

I have published on a suite of simulations requiring about 70 million CPU hours
executed on some of America's largest supercomputers, in particular OLCF's Titan
and NCSA's Blue Waters.  In [this
paper](http://adsabs.harvard.edu/abs/2016ApJ...827...84J), I describe the bulk
properties of the largest ever suite of 3D models describing the pre-explosive
dynamics of 18 different sub-Chandrasekhar system configurations. 
