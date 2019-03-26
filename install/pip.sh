if ! is-executable pip -o ! is-executable pipenv; then
  echo "Skipped: pip (missing: brew and/or git)"
  return
fi

sudo easy_install pip

# Globally install with npm

packages=(
  requests
  pipenv
  matplotlib
  numpy
  pandas
  nltk
)

sudo pip install "${packages[@]}"
sudo pip3 install "${packages[@]}"
