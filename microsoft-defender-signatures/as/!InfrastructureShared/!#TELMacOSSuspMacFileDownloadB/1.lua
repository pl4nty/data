-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspMacFileDownloadB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (macos.GetDownloadUrl)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3, l_0_4 = (string.match)(l_0_2, "^(%w+)://([^:/]+)")
if l_0_3 == "" or l_0_3 == nil or l_0_4 == "" or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_3 .. "://" .. l_0_4
local l_0_6, l_0_7 = (mp.CheckUrl)(l_0_5)
if l_0_6 == 1 and l_0_7 == 1 then
  return mp.CLEAN
end
local l_0_8 = {}
l_0_8.SIG_CONTEXT = "LUA_GENERIC"
l_0_8.TAG = "MAC_INITIAL_ACCESS"
local l_0_9 = SafeGetUrlReputation
local l_0_10 = {}
-- DECOMPILER ERROR at PC86: No list found for R10 , SetList fails

-- DECOMPILER ERROR at PC87: Overwrote pending register: R11 in 'AssignReg'

l_0_9 = l_0_9(l_0_10, l_0_5, false, 2000)
if l_0_9 then
  l_0_10 = l_0_9.urls
  l_0_10 = l_0_10[l_0_5]
  if l_0_10 then
    l_0_10 = l_0_9.urls
    l_0_10 = l_0_10[l_0_5]
    l_0_10 = l_0_10.determination
    if l_0_10 ~= 2 then
      l_0_10 = l_0_9.urls
      l_0_10 = l_0_10[l_0_5]
      l_0_10 = l_0_10.determination
      if l_0_10 ~= 3 then
        l_0_10 = l_0_9.urls
        l_0_10 = l_0_10[l_0_5]
        l_0_10 = l_0_10.determination
        if l_0_10 ~= 5 then
          l_0_10 = l_0_9.urls
          l_0_10 = l_0_10[l_0_5]
          l_0_10 = l_0_10.determination
          if l_0_10 ~= 6 then
            l_0_10 = l_0_9.urls
            l_0_10 = l_0_10[l_0_5]
            l_0_10 = l_0_10.determination
          end
        end
      end
    end
    if l_0_10 == 7 then
      l_0_10 = mp
      l_0_10 = l_0_10.INFECTED
      return l_0_10
    end
  end
end
l_0_10 = mp
l_0_10 = l_0_10.CLEAN
return l_0_10

