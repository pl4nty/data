-- Threat: !InfrastructureShared
-- Name: abd79c347d9c
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
local l_0_1 = 0
local l_0_2 = 0
local l_0_3 = ""
if l_0_0 == nil or l_0_0.image_path == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
for l_0_4 = 1, 6 do
  if l_0_0 ~= nil then
    if l_0_0.image_path ~= nil then
      l_0_3 = string.lower(l_0_0.image_path)
      if l_0_3:find("\\wscript.exe") or l_0_3:find("\\mshta.exe") or l_0_3:find("\\cmd.exe") then
        l_0_1 = 1
      elseif l_0_1 == 1 and (l_0_3:find("equation\\eqnedt32.exe") or l_0_3:find("office.-\\excel%.exe$") or l_0_3:find("office.-\\winword%.exe$")) then
        l_0_2 = 1
      end
    end
    if l_0_0.ppid ~= nil then
      l_0_0 = mp.GetParentProcInfo(l_0_0.ppid)
    else
      l_0_0 = nil
      break
    end
  else
    break
  end
  if 4 < l_0_4 and l_0_1 ~= 1 then
    break
  end
end
if l_0_1 == 1 and l_0_2 == 1 then
  return mp.INFECTED
end
return mp.CLEAN
