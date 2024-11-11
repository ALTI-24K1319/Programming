#1
using HorizonSideRobots
function do_upora!(robot,side)
    n = 0
    while !isborder(robot,side)
        putmarker!(robot)
        move!(robot,side)
        putmarker!(robot)
        n+=1
    end
    return n
end

function HorizonSideRobots.move!(robot,side,num_steps::Integer)
    for i in 1:num_steps
        move!(robot,side)
    end
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)

function cross!(robot)
    for side in (Nord,Ost,Sud,West)
        num_steps = do_upora!(robot,side)
        side = inverse(side)
        move!(robot,side,num_steps)
    end
    
end