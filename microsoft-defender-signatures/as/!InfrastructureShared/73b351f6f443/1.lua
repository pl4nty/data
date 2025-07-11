-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b351f6f443\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
  local l_0_0 = (this_sigattrlog[2]).utf8p2
  local l_0_1 = (versioning.GetOrgID)()
  if l_0_1 == nil or l_0_1 == "" or l_0_1:lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and l_0_1:lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and l_0_1:lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and l_0_1:lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and l_0_1:lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and l_0_1:lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and l_0_1:lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and l_0_1:lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and l_0_1:lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and l_0_1:lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, "^/Users/[^/]+/Desktop/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Documents/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Downloads/[^/]+$", 1, false) or (string.find)(l_0_0, "^/private/tmp/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Desktop/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Documents/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Downloads/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_0, "^/private/tmp/[^/]+/[^/]+$", 1, false) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

