import jenkins.model.*

def inst = Jenkins.getInstance()

def desc = inst.getDescriptor("hudson.plugins.git.GitSCM")

desc.setGlobalConfigName("conchayoro")
desc.setGlobalConfigEmail("user@conchayoro.com")

desc.save()
