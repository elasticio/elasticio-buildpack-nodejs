log_resources() {
  if [[ $ELASTICIO_MEMORY_AVAILABLE ]]; then
    echo "Detected $ELASTICIO_MEMORY_AVAILABLE MB available memory"
  fi
  if [[ $ELASTICIO_CPU_AVAILABLE ]]; then
    echo "Detected $ELASTICIO_CPU_AVAILABLE CPU available"
  fi
}

log_resources
