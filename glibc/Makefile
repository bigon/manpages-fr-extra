PACKAGE=glibc

include ../Makefile.common

post-build:
	$(call create_link,pthread_mutexattr_init.3,pthread_mutexattr_gettype.3);
	$(call create_link,pthread_mutexattr_init.3,pthread_mutexattr_settype.3);
	$(call create_link,pthread_mutexattr_init.3,pthread_mutexattr_destroy.3);
	$(call create_link,pthread_mutex_init.3,pthread_mutex_destroy.3);
	$(call create_link,pthread_mutex_init.3,pthread_mutex_unlock.3);
	$(call create_link,pthread_mutex_init.3,pthread_mutex_trylock.3);
	$(call create_link,pthread_mutex_init.3,pthread_mutex_lock.3);
	$(call create_link,pthread_condattr_init.3,pthread_condattr_destroy.3);
	$(call create_link,pthread_cond_init.3,pthread_cond_destroy.3);
	$(call create_link,pthread_cond_init.3,pthread_cond_timedwait.3);
	$(call create_link,pthread_cond_init.3,pthread_cond_wait.3);
	$(call create_link,pthread_cond_init.3,pthread_cond_broadcast.3);
	$(call create_link,pthread_cond_init.3,pthread_cond_signal.3);
	$(call create_link,pthread_key_create.3,pthread_setspecific.3);
	$(call create_link,pthread_key_create.3,pthread_key_delete.3);
	$(call create_link,pthread_key_create.3,pthread_getspecific.3);
