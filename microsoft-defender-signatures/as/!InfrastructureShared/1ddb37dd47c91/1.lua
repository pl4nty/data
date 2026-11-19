-- Threat: !InfrastructureShared
-- Name: 1ddb37dd47c91
-- Type: 21

function add_related_file_if_exists(l_1_0)
  if l_1_0.matched and l_1_0.utf8p2 ~= nil then
    local l_1_1 = mp.ContextualExpandEnvironmentVariables(l_1_0.utf8p2)
    
    bm.add_related_file(l_1_1)
  end
end

add_related_file_if_exists(this_sigattrlog[1])
add_related_file_if_exists(this_sigattrlog[2])
add_related_file_if_exists(this_sigattrlog[3])
add_related_file_if_exists(this_sigattrlog[4])
return mp.INFECTED
