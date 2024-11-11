#3
using HorizonSideRobots
function do_upora!(robot,side)
    count=0
    while !isborder(robot,side)
        move!(robot,side)
        count+=1
    end
    return count
end

function mark_path!(robot,side)
    while !isborder(robot,side)
        putmarker!(robot)
        move!(robot,side)
        putmarker!(robot)
    end
end


function HorizonSideRobots.move!(robot,side,num_steps::Integer)
    for _ in 1:num_steps
        move!(robot,side)
    end
end

function all_in!(robot)
    num_steps_sud = do_upora!(robot,Sud)
    num_steps_west = do_upora!(robot,West)
    while !isborder(robot,Ost)
        mark_path!(robot,Nord)
        move!(robot,Ost)
        mark_path!(robot,Sud)
        
    end
do_upora!(robot,West)
move!(robot,Nord,num_steps_sud)
move!(robot,Ost,num_steps_west)
end