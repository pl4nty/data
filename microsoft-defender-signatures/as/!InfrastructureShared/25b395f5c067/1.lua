-- Threat: !InfrastructureShared
-- Name: 25b395f5c067
-- Type: 21

function is_in_program_files(l_1_0)
  if string.match(l_1_0, "%a:\\program files") ~= nil then
    return true
  else
    return false
  end
end

function is_clickonce_app(l_2_0)
  if string.match(l_2_0, "\\appdata\\local\\apps\\2.0\\") ~= nil then
    return true
  else
    return false
  end
end

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if is_in_program_files(l_0_0) then
  return mp.CLEAN
end
if is_clickonce_app(l_0_0) then
  return mp.CLEAN
end
return mp.INFECTED
