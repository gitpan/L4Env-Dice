#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

/* 
   consider using POLLUTE 
   for backward compatibility
*/

#include "ppport.h"

/* 
   user configuration file 
   XXX: subject to changes in the future: consider $(OBJDIR)/config.h
*/

#include "include/template_config.h"


MODULE = L4Env::Dice		PACKAGE = L4Env::Dice		

