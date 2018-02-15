#!/usr/bin/env bash

dir=/var/db/paludis/repositories/${TARGET}

pushd $dir >/dev/null
err=0

if [[ -n $(git status -s) ]]; then
  err=1
fi

popd >/dev/null

if [[ $err -eq 1 ]]; then
  echo "You have unstashed changes in repository ${TARGET}, not syncing"
fi

exit $err
