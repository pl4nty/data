-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25b32fb16825\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
do
  if l_0_0 ~= nil and l_0_0 ~= "" and l_0_0:lower() == "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" then
    local l_0_1 = (bm.get_imagepath)()
    if l_0_1 ~= nil and ((string.match)(l_0_1, "/bin/%a*sh") or (string.find)(l_0_1, "perl", 1, true) or (string.find)(l_0_1, "python", 1, true)) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

