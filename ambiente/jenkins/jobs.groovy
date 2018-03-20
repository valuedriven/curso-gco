folder('conchayoro') {
    description('Estrutura para jobs da ConchayOro')
}

job('conchayoro/compile-package') {
    scm {
        git('http://github.com/valuedriven/curso-gco')
    }
    steps {
        shell('mvn clean --settings ambiente/maven/settings.xml')
        shell('mvn compile --settings ambiente/maven/settings.xml')
        shell('mvn package --settings ambiente/maven/settings.xml')
    }
}

job('conchayoro/install-deploy') {
    scm {
        git('http://github.com/valuedriven/curso-gco')
    }
    steps {
        shell('mvn install --settings ambiente/maven/settings.xml')
        shell('mvn deploy --settings ambiente/maven/settings.xml')
    }
}

job('conchayoro/deploy-tomcat') {
    scm {
        git('http://github.com/valuedriven/curso-gco')
    }
    steps {
        shell('mvn tomcat7:deploy --settings ambiente/maven/settings.xml')
        shell('mvn tomcat7:redeploy --settings ambiente/maven/settings.xml')
    }
}
