-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15eb3a866f654\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_2 = nil, nil, nil
local l_0_3 = nil
if (versioning.GetOrgID)() == nil or (versioning.GetOrgID)() == "" or ((versioning.GetOrgID)()):lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and ((versioning.GetOrgID)()):lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and ((versioning.GetOrgID)()):lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and ((versioning.GetOrgID)()):lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and ((versioning.GetOrgID)()):lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and ((versioning.GetOrgID)()):lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and ((versioning.GetOrgID)()):lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and ((versioning.GetOrgID)()):lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and ((versioning.GetOrgID)()):lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and ((versioning.GetOrgID)()):lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC92: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC95: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC98: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC117: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC120: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC123: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC129: Confused about usage of register: R1 in 'UnsetPending'

-- DECOMPILER ERROR at PC135: Confused about usage of register: R1 in 'UnsetPending'

-- DECOMPILER ERROR at PC144: Confused about usage of register: R1 in 'UnsetPending'

-- DECOMPILER ERROR at PC153: Confused about usage of register: R1 in 'UnsetPending'

-- DECOMPILER ERROR at PC162: Confused about usage of register: R1 in 'UnsetPending'

-- DECOMPILER ERROR at PC171: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC171: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC171: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC171: Unhandled construct in 'MakeBoolean' P3

if (((not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" or (this_sigattrlog[4]).matched) and not (this_sigattrlog[5]).matched) or l_0_3 ~= nil) and (this_sigattrlog[3]).utf8p2 ~= nil and is_valid_ip((this_sigattrlog[3]).utf8p2) == nil and (string.find)((this_sigattrlog[3]).utf8p2, "/bin/bash", 1, true) == nil and (string.find)((this_sigattrlog[3]).utf8p2, "/bin/sh", 1, true) == nil and (string.find)((this_sigattrlog[3]).utf8p2, "/bin/zsh", 1, true) == nil and (string.find)((this_sigattrlog[3]).utf8p2, "sh -i", 1, true) == nil then
  return mp.CLEAN
end
local l_0_4 = nil
-- DECOMPILER ERROR at PC185: Confused about usage of register: R2 in 'UnsetPending'

if (bm.get_imagepath)() ~= nil and (bm.get_imagepath)() ~= "" and (this_sigattrlog[3]).ppid ~= nil then
  (bm.trigger_sig)("GenericReverseShell", (bm.get_imagepath)(), (this_sigattrlog[3]).ppid)
  return mp.INFECTED
end
return mp.CLEAN

