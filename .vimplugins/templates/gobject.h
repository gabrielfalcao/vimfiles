/**
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

#ifndef _@NS@_@TYPE@_H
#define _@NS@_@TYPE@_H

#include <glib.h>
#include <glib-object.h>

G_BEGIN_DECLS

#define @NS@_TYPE_@TYPE@                   (@ns@_@type@_get_type ())
#define @NS@_@TYPE@(obj)                   (G_TYPE_CHECK_INSTANCE_CAST ((obj), @NS@_TYPE_@TYPE@, @Ns@@Type@))
#define @NS@_@TYPE@_CLASS(klass)           (G_TYPE_CHECK_CLASS_CAST ((klass), @NS@_TYPE_@TYPE@, @Ns@@Type@Class))
#define @NS@_IS_@TYPE@(obj)                (G_TYPE_CHECK_INSTANCE_TYPE ((obj), @NS@_TYPE_@TYPE@))
#define @NS@_IS_@TYPE@_CLASS(klass)        (G_TYPE_CHECK_CLASS_TYPE ((klass), @NS@_TYPE_@TYPE@))
#define @NS@_@TYPE@_GET_CLASS(obj)         (G_TYPE_INSTANCE_GET_CLASS ((obj), @NS@_TYPE_@TYPE@, @Ns@@Type@Class))

typedef struct _@Ns@@Type@ @Ns@@Type@;
typedef struct _@Ns@@Type@Class @Ns@@Type@Class;

struct _@Ns@@Type@
{
  GObject parent;
};

struct _@Ns@@Type@Class
{
  GObjectClass parent;
};

GType @ns@_@type@_get_type (void);
@Ns@@Type@ *@ns@_@type@_new (void);

G_END_DECLS

#endif /* _@NS@_@TYPE@_H */
