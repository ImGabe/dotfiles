#!/bin/bash

# Termine instâncias de barras em execução
killall -q polybar

# Espere até que os processos em execução sejam terminados
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# execute a Polybar, usando a configuração padrão ~/.config/polybar/config
polybar bar &
