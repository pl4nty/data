-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\243b39fae523b\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
local l_0_2 = nil
if (versioning.GetOrgID)() == nil or (versioning.GetOrgID)() == "" or ((versioning.GetOrgID)()):lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and ((versioning.GetOrgID)()):lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and ((versioning.GetOrgID)()):lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and ((versioning.GetOrgID)()):lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and ((versioning.GetOrgID)()):lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and ((versioning.GetOrgID)()):lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and ((versioning.GetOrgID)()):lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and ((versioning.GetOrgID)()):lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and ((versioning.GetOrgID)()):lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and ((versioning.GetOrgID)()):lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" then
  return mp.CLEAN
end
if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil and (this_sigattrlog[6]).utf8p1 ~= "" then
  l_0_2 = (this_sigattrlog[6]).utf8p1
else
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil and (this_sigattrlog[7]).utf8p1 ~= "" then
    l_0_2 = (this_sigattrlog[7]).utf8p1
  end
end
-- DECOMPILER ERROR at PC123: Overwrote pending register: R1 in 'AssignReg'

if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 == "" or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
  local l_0_3, l_0_4 = (this_sigattrlog[2]).utf8p2
  if l_0_3 ~= nil and l_0_2 ~= nil and l_0_2:match("(.+)/([^/]+)$") ~= nil and (string.find)(l_0_3, R7_PC139, 1, true) and (string.find)(l_0_3, R7_PC139, 1, true) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

