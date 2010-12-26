/*
 * Copyright (C) 2008 Gabriel Falcão <gabriel@nacaolivre.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "@ns@-@type@.h"

static void @ns@_@type@_class_init (@Ns@@Type@Class * klass);
static void @ns@_@type@_init (@Ns@@Type@ * self);

GType
@ns@_@type@_get_type (void)
{
  static GType type = 0;

  if (type == 0)
    {
      static const GTypeInfo info = {
        sizeof (@Ns@@Type@Class),
        NULL,                   /* base_init */
        NULL,                   /* base_finalize */
        (GClassInitFunc) @ns@_@type@_class_init,  /* class_init */
        NULL,                   /* class_finalize */
        NULL,                   /* class_data */
        sizeof (@Ns@@Type@),
        0,                      /* n_preallocs */
        (GInstanceInitFunc) @ns@_@type@_init,     /* instance_init */
        NULL
      };
      type =
        g_type_register_static (G_TYPE_OBJECT, "@Ns@@Type@Type", &info,
                                0);
    }
  return type;
}

static void
@ns@_@type@_class_init (@Ns@@Type@Class * klass)
{
}

static void
@ns@_@type@_init (@Ns@@Type@ * self)
{
}

@Ns@@Type@ *
@ns@_@type@_new ()
{
  @Ns@@Type@ *obj;

  obj = g_object_new (@NS@_TYPE_@TYPE@, NULL);
  return obj;
}
