-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bb9b39c6c60df\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC18: freeLocal<0 in 'ReleaseLocals'

-- DECOMPILER ERROR at PC36: freeLocal<0 in 'ReleaseLocals'

-- DECOMPILER ERROR at PC54: freeLocal<0 in 'ReleaseLocals'

-- DECOMPILER ERROR at PC72: freeLocal<0 in 'ReleaseLocals'

-- DECOMPILER ERROR at PC90: freeLocal<0 in 'ReleaseLocals'

-- DECOMPILER ERROR at PC108: freeLocal<0 in 'ReleaseLocals'

-- DECOMPILER ERROR at PC126: freeLocal<0 in 'ReleaseLocals'

-- DECOMPILER ERROR at PC144: freeLocal<0 in 'ReleaseLocals'

-- DECOMPILER ERROR at PC145: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC145: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC145: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC145: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC145: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC145: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC145: Unhandled construct in 'MakeBoolean' P3

if ((((((((((((((((this_sigattrlog[1]).matched or (this_sigattrlog[9]).matched) and (this_sigattrlog[2]).matched) or (this_sigattrlog[10]).matched) and (this_sigattrlog[3]).matched) or (this_sigattrlog[11]).matched) and (this_sigattrlog[4]).matched) or (this_sigattrlog[12]).matched) and (this_sigattrlog[5]).matched) or (this_sigattrlog[13]).matched) and (this_sigattrlog[6]).matched) or (this_sigattrlog[14]).matched) and (this_sigattrlog[7]).matched) or (this_sigattrlog[15]).matched) and (this_sigattrlog[8]).matched) or (this_sigattrlog[16]).matched) and not (this_sigattrlog[8]).utf8p1 then
  local l_0_11 = (this_sigattrlog[16]).utf8p1
  if not l_0_11 or not contains(l_0_11, {"Image File Execution Options\\msseces.exe", "Image File Execution Options\\msmpeng.exe", "Image File Execution Options\\mpcmdrun.exe", "Image File Execution Options\\msascui.exe", "Image File Execution Options\\mpuxsrv.exe", "Image File Execution Options\\NisSrv.exe", "Image File Execution Options\\SecurityHealthService.exe", "Image File Execution Options\\SecurityHealthSystray.exe"}) then
    return mp.CLEAN
  end
  return mp.INFECTED
end

