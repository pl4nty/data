-- Threat: !InfrastructureShared
-- Name: 4b29cc30e87c
-- Type: 21

local l_0_0 = mp.getfilesize()
if 100 <= l_0_0 and l_0_0 <= 10240 then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_PATH)
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  local l_0_2 = "/opt/"
  if l_0_1:sub(1, #l_0_2) == l_0_2 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
