/* $Id$ 
file: 
	include/template_config.h
type:
	template all-purpose configuration file 
description: 
	used to declare stuff.

	in your XS files: 
		#include <include/template_config.h> 

author:
	$Author$
*/


/* 
   determine the stub code generator 
   we'll use to compile clients libraries 
*/
#define HAVE_WORKING_L4_COMPILER	"dice"

/* define this if your system support dynamic linking */
#define HAVE_DL_OPEN	"-ldl" 

/* XXX do we need DL_CLOSE facility ? */
#undef HAVE_DL_CLOSE	

/* 
	Experimental, build a dynamically linked perl interpreter 
	object for our clients interfaces 
*/

/* XXX do sanity checks here */ 
#ifdef HAVE_DL_OPEN
#define LIBS "-ldl" 
#define PERL_INTERPRETER	"l4_libperl_interp.so"           
#endif
	

