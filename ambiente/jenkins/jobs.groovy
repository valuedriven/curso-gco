folder('conchayoro') {
    description('Estrutura para jobs da ConchayOro')
}

job('conchayoro/compile-package') {
    scm {
        git('http://github.com/valuedriven/curso-gco')
    }
    
    steps {
        mavenInstallation('Maven-3.5.3')
        maven('clean --settings ambiente/maven/settings.xml')
        maven('compile --settings ambiente/maven/settings.xml')
        maven('package --settings ambiente/maven/settings.xml')
    }
}

job('conchayoro/install-deploy') {
    scm {
        git('http://github.com/valuedriven/curso-gco')
    }

    steps {
        mavenInstallation('Maven-3.5.3')
        maven('install --settings ambiente/maven/settings.xml')
        maven('deploy --settings ambiente/maven/settings.xml')
    }
}

job('conchayoro/deploy-tomcat') {
    scm {
        git('http://github.com/valuedriven/curso-gco')
    }

    steps {
        mavenInstallation('Maven-3.5.3')
        maven('tomcat7:deploy --settings ambiente/maven/settings.xml')
        maven('tomcat7:redeploy --settings ambiente/maven/settings.xml')
    }
}
