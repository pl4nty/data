-- Threat: \xac\xa1TestOpenCreateProcessHintEnabled
-- Type: 12

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == "/tmp/2813dbf5-607f-409d-85a7-3b172cb14f19" then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
  if l_0_1 == 2 then
    local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT)
    if l_0_2 == true then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
