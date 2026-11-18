-- Threat: !InfrastructureShared
-- Name: 39b39fee5f66
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].ppid ~= nil then
  l_0_1 = this_sigattrlog[1].ppid
  l_0_0 = mp.GetProcessCommandLine(l_0_1)
end
local l_0_2
if this_sigattrlog[2].matched and this_sigattrlog[2].ppid ~= nil then
  l_0_2 = this_sigattrlog[2].ppid
end
local l_0_3, l_0_4
if l_0_2 ~= nil then
  l_0_4 = this_sigattrlog[2].image_path
  l_0_3 = string.lower(l_0_4):match("\\([^\\]+)$")
  if string.find(l_0_0, l_0_3) ~= nil and l_0_1 == l_0_2 then
    return mp.INFECTED
  else
    local l_0_5 = mp.GetParentProcInfo(l_0_1)
    if l_0_5 ~= nil and l_0_5.image_path ~= nil then
      local l_0_6 = string.lower(l_0_5.image_path):match("\\([^\\]+)$")
      if l_0_6 ~= nil and string.find(l_0_6, l_0_3) ~= nil and l_0_5.ppid == l_0_2 then
        return mp.INFECTED
      else
        local l_0_7 = mp.GetParentProcInfo(l_0_5.ppid)
        if l_0_7 ~= nil and l_0_7.image_path ~= nil then
          local l_0_8 = string.lower(l_0_7.image_path):match("\\([^\\]+)$")
          if l_0_8 ~= nil and string.find(l_0_8, l_0_3) and l_0_7.ppid == l_0_2 then
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
