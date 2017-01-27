log_resources() {
  if [[ $ELASTICIO_MEMORY_AVAILABLE ]]; then
    echo "Detected $ELASTICIO_MEMORY_AVAILABLE MB available memory"
  fi
  if [[ $ELASTICIO_CPU_AVAILABLE ]]; then
    echo "Detected $ELASTICIO_CPU_AVAILABLE CPU available"
  fi
}

log_resources

export ELASTICIO_MEMORY_AVAILABLE=$ELASTICIO_MEMORY_AVAILABLE
export ELASTICIO_CPU_AVAILABLE=$ELASTICIO_CPU_AVAILABLE
