-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3329c1d93b41\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("SCRIPT:SuspClickfix.A") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 512 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetBruteMatchData)()
local l_0_2 = ""
if l_0_1.is_header then
  l_0_2 = tostring(headerpage)
else
  l_0_2 = tostring(footerpage)
end
local l_0_3, l_0_4 = l_0_2:match("(%d+%.%d+%.%d+%.%d+):(%d+)")
do
  do
    if l_0_3 and l_0_4 then
      local l_0_5 = {}
      l_0_5[8080] = true
      l_0_5[8000] = true
      l_0_5[8443] = true
      l_0_5[8888] = true
      l_0_5 = l_0_5[l_0_4]
      l_0_5 = l_0_5 ~= nil
      if l_0_5 then
        return mp.CLEAN
      end
      if isPublicIP(l_0_3) then
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

