-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaAppleDevAttributesExtracted\0x0000c3f5_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  do
    local l_1_1 = {}
    -- DECOMPILER ERROR at PC6: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC7: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC8: Overwrote pending register: R3 in 'AssignReg'

    for l_1_5,l_1_6 in ("Apple Development: .+ %((.+)%)$")("Apple Distribution: .+ %((.+)%)$") do
      local l_1_7 = (string.match)(l_1_0, l_1_6)
      if l_1_7 then
        return l_1_7
      end
    end
    do return nil end
    -- WARNING: undefined locals caused missing assignments!
  end
end

local l_0_2 = function()
  -- function num : 0_1 , upvalues : l_0_0
  local l_2_0 = (mp.GetCertificateInfo)()
  if #l_2_0 < 1 or l_2_0 == nil then
    return nil, nil
  end
  local l_2_1, l_2_2 = nil, nil
  for l_2_6,l_2_7 in pairs(l_2_0) do
    for l_2_11,l_2_12 in pairs(l_2_7.Certificates) do
      if l_2_12.SubjectUtf8 ~= nil then
        local l_2_13 = l_2_12.SubjectUtf8
        if l_2_13.CommonName ~= nil then
          l_2_2 = l_0_0(l_2_13.CommonName)
        end
        if l_2_2 ~= nil then
          l_2_1 = l_2_13.OrganizationUnit
          return l_2_2, l_2_1
        end
      end
    end
  end
end

local l_0_3 = "Lua:MacOS_X/AppleDeveloperID_"
if (mp.get_mpattributesubstring)(l_0_3) or (mp.get_mpattributesubstring)("Lua:MacOS_X/AppleTeamID_") or (mp.get_mpattributesubstring)("Lua:AppleDevAttributesExtracted") then
  return mp.CLEAN
end
do
  local l_0_4, l_0_5 = , l_0_2()
  if l_0_5 == nil and "Lua:AppleDevAttributesExtracted" == nil then
    return mp.CLEAN
  end
  if #l_0_5 == 10 then
    (mp.set_mpattribute)(l_0_3 .. l_0_5)
  end
  if #"Lua:AppleDevAttributesExtracted" == 10 then
    (mp.set_mpattribute)(l_0_4 .. R8_PC51)
  end
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC56: freeLocal<0 in 'ReleaseLocals'

end

