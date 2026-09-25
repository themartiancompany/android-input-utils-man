..
   SPDX-License-Identifier: AGPL-3.0-or-later

   -------------------------------------------------------
   Copyright © 2024, 2025, 2026
               Pellegrino Prevete

   All rights reserved
   -------------------------------------------------------

   This program is free software: you can redistribute it
   and/or modify it under the terms of the
   GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the
   License, or (at your option) any later version.

   This program is distributed in the hope that it will
   be useful, but WITHOUT ANY WARRANTY; without even the
   implied warranty of MERCHANTABILITY or FITNESS FOR A
   PARTICULAR PURPOSE.
   See the GNU Affero General Public License
   for more details.

   You should have received a copy of the
   GNU Affero General Public License
   along with this program.
   If not, see <https://www.gnu.org/licenses/>.


=============================
key2keyevent
=============================

--------------------------------------------------------------
Key to Key Event
--------------------------------------------------------------
:Version: key2keyevent |version|
:Manual section: 1


Synopsis
========

key2keyevent *[options]* *input-key*


Description
===========

Returns Android key code for a given input key.


Arguments
============

* *input-key*
  
  Any type of symbolic function you can think which
  could go on a keyboard or on a physical button,
  for example a letter or the 'eject disc' button
  on a keyboard or the volume or power button on a
  phone. Any switch-like object, a 'key-event'.


Application options
=====================

-h                   Display help.
-c                   Enable color output
-v                   Enable verbose output


Bugs
====

https://github.com/themartiancompany/android-input-utils/-/issues


Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* coordinates-orthonormal
* activity-launch
* activity-focused
* bbrightnessctl
* displayctl
* powerctl
* sissystemctl

.. include:: variables.rst
