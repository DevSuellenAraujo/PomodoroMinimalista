#!/bin/bash
# Condicional de instalação do pacote notificação
inst_pacote="libnotify-bin"
if ! dpkg -l | grep -q "$inst_pacote"; then
    echo "O arquivo $inst_pacote para notificações não foi encontrado. A instalação está sendo feita agora..."
    sudo apt update && sudo apt install -y "$inst_pacote"
fi

# Função tempo do pomodoro
cont_regressiva() {
    MINUTOS=$1
    while [ $MINUTOS -gt 0 ]; do
        echo -ne "Tempo restante: $(date -u -d @"$MINUTOS" +%H:%M:%S)\r"
        sleep 1
        ((MINUTOS--))
        # Função para parada do pomodoro
        if read -t 1 -n 1 tecla && [[ $tecla == "q" ]]; then
            echo -e "\nPomodoro interrompido, clique 'q' para a pausa ou pular!"
            return
        fi
    done
    echo -ne "\n"
}

# Função de notificação
notificacao() {
    notify-send "$1"
}

# Função da descrição
descricao() {
    clear
    echo "★¸.•☆•.¸★ DESCRIÇÃO DO PROJETO MINIPOMO (Pomodoro Minimalista) ★⡀.•☆•.★"
    echo ""
    echo -e "Olá, bem-vindo ao meu primeiro projeto em linguagem bash,\nme chamo Suellen Araújo Costa e essa é uma atividade avaliativa."
    echo -e "(Acredito que há algumas funcionalidades pendentes a serem melhoradas, mas esse código não acaba aqui.)\nAguardem..."
    echo ""
    echo "Clique em alguma tecla para voltar."
    read -n 1 -s
    clear
}

# Loop e menu principal
while true; do
    echo ",-*' ^ '~*-.,_,.-*~ Menu ~*-.,_,.-*~' ^ '*-,"
    echo ""
    echo "1. Pomodoro Personalizado"
    echo "2. Pomodoro Padrão (25 minutos)"
    echo "h. Ver descrição"
    echo "z. Sair"
    echo ""
    echo ",-*' ^ '~*-.,_,.-*~ Menu ~*-.,_,.-*~' ^ '*-,"
    read -n 1 -s opcao
    case $opcao in
        1) # Pomodoro personalizado
            clear
            read -p "Digite a duração do Pomodoro em minutos: " ENT_MINUTOS
            DURACAO_MINUTOS=$(( (${ENT_MINUTOS:-25}) * 60 ))
            read -p "Digite a duração da pausa em minutos: " ENT_PAUSA
            DURACAO_PAUSA=$(( (${ENT_PAUSA:-5}) * 60 ))

            echo ""
            echo "Iniciando Pomodoro de $(($DURACAO_MINUTOS / 60)) minutos..."
            echo "Pressione 'q' para parar."
            echo ""
            cont_regressiva $DURACAO_MINUTOS
            if [[ $? -ne 0 ]]; then
                continue
            fi
            read -n 1 -s
            notificacao "Pomodoro finalizado! Pausa de $(($DURACAO_PAUSA / 60)) minutos."
            echo "Pomodoro finalizado!"
            echo ""
            cont_regressiva $DURACAO_PAUSA
            notificacao "Pausa finalizada!"
            echo "Pausa finalizada!"
            clear
            ;;
        2) # Pomodoro padrão automático
            clear
            DURACAO_MINUTOS=1500  # 25 minutos
            DURACAO_PAUSA=300     # 5 minutos
            echo "Iniciando Pomodoro padrão de 25 minutos..."
            echo "Pressione 'q' para parar."
            echo ""
            cont_regressiva $DURACAO_MINUTOS
            if [[ $? -ne 0 ]]; then
                continue
            fi
            notificacao "Pomodoro finalizado! Pausa de 5 minutos."
            echo "Pomodoro finalizado! Pausa de 5 minutos."
            cont_regressiva $DURACAO_PAUSA
            notificacao "Pausa finalizada!"
            echo "Pausa finalizada!"
            clear
            ;;
        h)
            descricao
            ;;
        z)
            echo ""
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção incorreta. Tente novamente..."
            sleep 2
            clear
            ;;
    esac
done

#condicional de instalação do pacote notificação
inst_pacote="libnotify-bin"
if ! dpkg -l | grep -q "$inst_pacote"; then
    echo "O arquivo $inst_pacote para notificações não foi encontrado. A instalação está sendo feita agora..."
    sudo apt update && sudo apt install -y "$inst_pacote"
fi

#função tempo do pomodoro
cont_regressiva() {
    MINUTOS=$1
    while [ $MINUTOS -gt 0 ]; do
        echo -ne "Tempo restante: $(date -u -d @"$MINUTOS" +%H:%M:%S)\r"
        sleep 1
        ((MINUTOS--))
        # Função para parada do pomodoro
        if read -t 1 -n 1 tecla && [[ $tecla == "q" ]]; then
            echo -e "\nPomodoro interrompido, clique 'q' para a pausa ou pular!"
            return
        fi
    done
    echo -ne "\n"
}

#função de notificação
notificacao() {
    notify-send "$1"
}

#função descrição
descricao() {
    clear
    echo "★¸.•☆•.¸★ DESCRIÇÃO DO PROJETO MINIPOMO (Pomodoro Minimalista) ★⡀.•☆•.★"
    echo ""
    echo -e "Olá, bem-vindo ao meu primeiro projeto em linguagem bash,\nme chamo Suellen Araújo Costa e essa é uma atividade avaliativa."
    echo -e "(Acredito que há algumas funcionalidades pendentes a serem melhoradas, mas esse código não acaba aqui.)\nAguardem..."
    echo ""
    echo "Clique em alguma tecla para voltar."
    read -n 1 -s
    clear
}

#loop e menu principal
while true; do
    echo ",-*' ^ '~*-.,_,.-*~ Menu ~*-.,_,.-*~' ^ '*-,"
    echo ""
    echo "1. Pomodoro Personalizado"
    echo "2. Pomodoro Padrão (25 minutos)"
    echo "h. Ver descrição"
    echo "z. Sair"
    echo ""
    echo ",-*' ^ '~*-.,_,.-*~ Menu ~*-.,_,.-*~' ^ '*-,"
    read -n 1 -s opcao
    case $opcao in
        1) #pomodoro personalizado
            clear
            read -p "Digite a duração do Pomodoro em minutos: " ENT_MINUTOS
            DURACAO_MINUTOS=$(( (${ENT_MINUTOS:-25}) * 60 ))
            read -p "Digite a duração da pausa em minutos: " ENT_PAUSA
            DURACAO_PAUSA=$(( (${ENT_PAUSA:-5}) * 60 ))

            echo ""
            echo "Iniciando Pomodoro de $(($DURACAO_MINUTOS / 60)) minutos..."
            echo "Pressione 'q' para parar."
            echo ""
            cont_regressiva $DURACAO_MINUTOS
            if [[ $? -ne 0 ]]; then
                continue
            fi
            read -n 1 -s
            notificacao "Pomodoro finalizado! Pausa de $(($DURACAO_PAUSA / 60)) minutos."
            echo "Pomodoro finalizado!"
            echo ""
            cont_regressiva $DURACAO_PAUSA
            notificacao "Pausa finalizada!"
            echo "Pausa finalizada!"
            clear
            ;;
        2) # Pomodoro padrão automático
            clear
            DURACAO_MINUTOS=1500  # 25 minutos
            DURACAO_PAUSA=300     # 5 minutos
            echo "Iniciando Pomodoro padrão de 25 minutos..."
            echo "Pressione 'q' para parar."
            echo ""
            cont_regressiva $DURACAO_MINUTOS
            if [[ $? -ne 0 ]]; then
                continue
            fi
            notificacao "Pomodoro finalizado! Pausa de 5 minutos."
            echo "Pomodoro finalizado! Pausa de 5 minutos."
            cont_regressiva $DURACAO_PAUSA
            notificacao "Pausa finalizada!"
            echo "Pausa finalizada!"
            clear
            ;;
        h) #abrir descrição
            descricao
            ;;
        z) #fechar programa
            echo ""
            echo "Saindo..."
            exit 0
            ;;
        *) #clique em opcao errada
            echo "Opção incorreta. Tente novamente..."
            sleep 2
            clear
            ;;
    esac
done

