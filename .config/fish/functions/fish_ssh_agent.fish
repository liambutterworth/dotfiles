function fish_ssh_agent --description "Start ssh-agent if not started yet, or uses already started ssh-agent."
    if test -z (pgrep ssh-agent | string collect)
        eval (ssh-agent -c)

        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    end
end
