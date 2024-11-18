using HorizonSideRobots
function cross_diag!(robot)
    num_steps_Nord = diag_p_West!(robot, Nord)
    diag_marker_Ost!(robot, Sud)
    diag_p_West!(robot, Nord)
    diag!(robot, Sud, num_steps_Nord)
    num_steps_Sud = diag_p_West!(robot, Sud)
    diag_marker_Ost!(robot, Nord)
    diag_p_West!(robot, Sud)
    diag!(robot, Nord, num_steps_Sud)
end

function diag_p_West!(robot, side)
    n = 0
    while (!isborder(robot, West)) && (!isborder(robot, side))
        move!(robot, West)
        move!(robot, side)
        n += 1
    end
    return n
end

function diag_marker_Ost!(robot, side)
    putmarker!(robot)
    while !isborder(robot, Ost) && !isborder(robot, side)
        move!(robot, side)
        move!(robot, Ost)
        putmarker!(robot)
    end
end

function diag!(robot, side, num_steps)
    for _ in 1:num_steps
        move!(robot, side)
        move!(robot, Ost)
    end
end