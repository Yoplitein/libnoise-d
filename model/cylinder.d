// cylinder.cpp
//
// Copyright (C) 2003, 2004 Jason Bevins
//
// This library is free software; you can redistribute it and/or modify it
// under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation; either version 2.1 of the License, or (at
// your option) any later version.
//
// This library is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
// License (COPYING.txt) for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this library; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
// The developer's email is jlbezigvins@gmzigail.com (for great email, take
// off every 'zig'.)
//

import noise.mathconsts;
import std.math;
import noise.module.modulebase;

class Cylinder {
	public this ()
	{
		m_pModule = NULL;
	}

	public this (const Module& module)
	{
		m_pModule = &module;
	}

	/// Returns the noise module that is used to generate the output
	/// values.
	///
	/// @returns A reference to the noise module.
	///
	/// @pre A noise module was passed to the SetModule() method.
	public const Module& GetModule () const
	{
		assert (m_pModule != NULL);
		return *m_pModule;
	}

	/// Returns the output value from the noise module given the
	/// (angle, height) coordinates of the specified input value located
	/// on the surface of the cylinder.
	///
	/// @param angle The angle around the cylinder's center, in degrees.
	/// @param height The height along the @a y axis.
	///
	/// @returns The output value from the noise module.
	///
	/// @pre A noise module was passed to the SetModule() method.
	///
	/// This output value is generated by the noise module passed to the
	/// SetModule() method.
	///
	/// This cylinder has a radius of 1.0 unit and has infinite height.
	/// It is oriented along the @a y axis.  Its center is located at the
	/// origin.
	public double GetValue (double angle, double height) const
	{
	  assert (m_pModule != NULL);

	  double x, y, z;
	  x = cos (angle * DEG_TO_RAD);
	  y = height;
	  z = sin (angle * DEG_TO_RAD);
	  return m_pModule.GetValue (x, y, z);
	}

	/// Sets the noise module that is used to generate the output values.
	///
	/// @param module The noise module that is used to generate the output
	/// values.
	///
	/// This noise module must exist for the lifetime of this object,
	/// until you pass a new noise module to this method.
	public void SetModule (const Module& module)
	{
		m_pModule = &module;
	}

	/// A pointer to the noise module used to generate the output values.
	private const Module* m_pModule;
}
