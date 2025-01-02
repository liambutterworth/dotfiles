function es
    set -l environment $argv[1]
    set -l endpoint $argv[2]
    set -l file $argv[3]

    set host (
        switch $environment
        case prod
            echo 'kibana.ipa.linuxboxes.net:9200'
        case stage
            echo 'kibana-stage.ipa.linuxboxes.net:9200'
        end
    )

    # if not string match -r '/' $endpoint
    #     set endpoint (echo "$endpoint/_search")
    # end

    if test -n "$file"
        eval curl \
            -XGET "'$host/$endpoint'" \
            -H "'Content-Type: application/json'" \
            -H "'Accept: application/json'" \
            -d "@"$file
    else
        eval curl -XGET "'$host/$endpoint'"
    end
end
