-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb34619873c\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0 = nil
  end
  local l_0_1 = nil
  if (bm.get_imagepath)() ~= nil and (bm.get_imagepath)() ~= "" and l_0_1 ~= nil then
    if ((bm.get_imagepath)()):find("/private/tmp/", 1, true) ~= 1 and ((bm.get_imagepath)()):find("/Users/Shared/", 1, true) ~= 1 and ((bm.get_imagepath)()):find("/tmp/", 1, true) ~= 1 and ((bm.get_imagepath)()):find("/Library/Caches/", 1, true) == nil and ((bm.get_imagepath)()):find("^/Users/[^/]+/Downloads/[^/]+$", 1, false) ~= 1 then
      return mp.CLEAN
    end
    local l_0_2 = nil
    if (versioning.GetOrgID)() ~= nil and (versioning.GetOrgID)() ~= "" and (((versioning.GetOrgID)()):lower() == "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7" or ((versioning.GetOrgID)()):lower() == "47d41a0c-188d-46d3-bbea-a93dbc0bfcaa") then
      return mp.INFECTED
    end
  end
  do
    return mp.CLEAN
  end
end

