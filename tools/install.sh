#!/bin/bash

set -e

GAMEDATA=${KSP_DIR:-lib/ksp}/GameData/kRPC
VERSION=`tools/krpc-version.sh`

bazel build \
    //:ksp-avc-version \
    //server \
    //service/SpaceCenter \
    //service/Drawing \
    //service/InfernalRobotics \
    //service/KerbalAlarmClock \
    //service/RemoteTech \
    //service/UI \
    //tools/TestingTools

rm -f $GAMEDATA/KRPC.dll
rm -rf $GAMEDATA
mkdir -p $GAMEDATA
cp -R -L \
    bazel-genfiles/kRPC.version \
    bazel-bin/server/KRPC.dll \
    bazel-bin/server/KRPC.xml \
    bazel-bin/server/src/icons \
    bazel-bin/service/SpaceCenter/KRPC.SpaceCenter.dll \
    bazel-bin/service/SpaceCenter/KRPC.SpaceCenter.xml \
    bazel-bin/service/Drawing/KRPC.Drawing.dll \
    bazel-bin/service/Drawing/KRPC.Drawing.xml \
    bazel-bin/service/InfernalRobotics/KRPC.InfernalRobotics.dll \
    bazel-bin/service/InfernalRobotics/KRPC.InfernalRobotics.xml \
    bazel-bin/service/KerbalAlarmClock/KRPC.KerbalAlarmClock.dll \
    bazel-bin/service/KerbalAlarmClock/KRPC.KerbalAlarmClock.xml \
    bazel-bin/service/RemoteTech/KRPC.RemoteTech.dll \
    bazel-bin/service/RemoteTech/KRPC.RemoteTech.xml \
    bazel-bin/service/UI/KRPC.UI.dll \
    bazel-bin/service/UI/KRPC.UI.xml \
    service/UI/KRPC.UI.ksp \
    bazel-krpc/external/csharp_protobuf_net35/file/Google.Protobuf.dll \
    bazel-krpc/external/csharp_krpc_io_ports/file/KRPC.IO.Ports.dll \
    bazel-bin/tools/TestingTools/TestingTools.dll \
    bazel-bin/tools/TestingTools/TestingTools.xml \
    service/SpaceCenter/src/module-manager.cfg \
    $GAMEDATA/
  cp -L bazel-krpc/external/module_manager/file/ModuleManager.3.0.7.dll $GAMEDATA/../

mkdir -p $GAMEDATA/PluginData
cp tools/settings.cfg $GAMEDATA/PluginData/

find $GAMEDATA -type f -exec chmod 644 {} \;
find $GAMEDATA -type d -exec chmod 755 {} \;

ls -lR $GAMEDATA
