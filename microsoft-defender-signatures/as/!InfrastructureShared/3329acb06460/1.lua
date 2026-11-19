-- Threat: !InfrastructureShared
-- Name: 3329acb06460
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.getfilename()
if l_0_0 ~= nil and (mp.get_mpattribute("PACKED_WITH:(Base64)") or l_0_0:find("%-%>%(Base64%)")) then
  mp.readprotection(false)
  local l_0_1 = mp.getfilesize()
  if l_0_1 < 32767 then
    local l_0_2 = mp.readfile(0, l_0_1)
    l_0_2 = string.lower(l_0_2)
    for l_0_3 in l_0_2:gmatch(".:\\users\\.-\\startup\\[^%s]*") do
      AppendToRollingQueue("PoshevinRelatedFiles", l_0_3, nil, 5000)
    end
    TrackPidAndTechnique("AMSI", "T1037", "b64_script_refers_startup")
  end
  return mp.INFECTED
end
return mp.CLEAN
