using HorizonSideRobots
function do_upora!(robot,side)
    k = 0
    while !isborder(robot,side)
        move!(robot,side)
        k+=1
    end
    return k
end

function x_mark!(robot)
    do_upora!(robot,Sud)
    do_upora!(robot,West)
    while !isborder(robot,Nord) || !isborder(robot,Ost)
        putmarker!(robot)
        move!(robot,Ost)
        move!(robot,Nord)
    end
end