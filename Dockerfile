FROM amazoncorretto:8 as build

RUN  yum install -y  wget unzip &&\
     mkdir findsecbugs && cd findsecbugs/ &&\
     wget https://github.com/find-sec-bugs/find-sec-bugs/releases/download/version-1.12.0/findsecbugs-cli-1.12.0.zip &&\
     unzip findsecbugs-cli-1.12.0.zip &&\
     chmod +x findsecbugs.sh &&\
     rm -f findsecbugs-cli-1.12.0.zip

FROM amazoncorretto:8

COPY --from=build /findsecbugs /findsecbugs
ENTRYPOINT [ "/findsecbugs/findsecbugs.sh","-home","/findsecbugs"] 